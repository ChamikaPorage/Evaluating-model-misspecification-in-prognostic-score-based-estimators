############################
# Simulation1 : Design C   #
############################
#contains function with argument N=sample size and seed
# that generates 1000 datasets of Design C, simulation 1.

library(xgboost)
library(ranger)
library(e1071)
library(caret)

gen.data.C <- function(N, seed){
  set.seed(seed)
  datat2 <- list(0)
  for (i in 1:1000) 
  {
    x1 <- runif(N, 1, 5)
    x2 <- runif(N, 1, 5)
    
    # Generate binary effect modifiers
    e1 <- rbinom(N, 1, 0.5)
    e2 <- rbinom(N, 1, 0.5)
    
    x12 <- x1^2
    x22 <- x2^2
    x_12 <- x1*x2
    
    a <- 0.8
    b <- 0.5
    b2 <- -0.15
    c <- 0.5
    c2 <- -0.15
    d1 <- -0.15
    d2<- 0.4
    
    prob <- pcauchy(a + b * x1 + b2 * x12 + c * x2 + c2 * x22 + d1 * e1 + d2 * e2 )
    
    tr <- rbinom(N, 1, prob)
    
    eps0 <- rgamma(N, 1)
    eps1 <- rgamma(N, 1)
    
    y0 <- 20 - 5 * x1 + 2 * x12 - 5 * x2 + 2 * x22 + 4 * x_12 + e1*tr + 2*e2*tr + eps0
    y1 <- 22 - 5 * x1 + 2 * x12 - 5 * x2 + 2 * x22 + 4 * x_12 + e1*tr + e2*tr + eps1
    y  <- ifelse(tr == 1, y1, y0)
    
    datat <- as.data.frame(cbind(x1, x12, x2, x22, x_12, tr, e1, e2, y0, y1, y))
    colnames(datat) <- c("x1", "x12", "x2", "x22", "x_12", "tr", "e1", "e2", "y0","y1", "y")
    
    #PS MODELS
    mod.ps <- glm(tr ~ x1 + x12 + x2 + x22 + x_12 + e1 + e2, family = binomial(link = "cauchit"), data = datat)
    ps <- fitted.values(mod.ps, type = "response") 
    datat$ps <- ps
    
    mod.psf1 <- glm(tr ~ x1 + x2 + e1, family = binomial(link = "logit"), data = datat)
    psf1 <- fitted.values(mod.psf1, type = "response") 
    datat$psf1 <- psf1
    
    #OR MODELS
    
    #Linear models
    
    datat0 <- subset(datat, datat$tr == 0)
    datat1 <- subset(datat, datat$tr == 1)
    
    #TRUE OR
    mod0 <- glm(y ~ x1 + x12 + x2 + x22 + x_12 + e1 + e2, family = Gamma(link = "identity"), data = datat0)
    mu0 <- predict(mod0, newdata = datat, type = "response")
    
    mod1 <- glm(y ~ x1 + x12 + x2 + x22 + x_12 + e1 + e2, family = Gamma(link = "identity"), data = datat1)
    mu1 <- predict(mod1, newdata = datat, type = "response")
    
    #FALSE OR
    
    mod0f <- lm(y ~ x1 + x2  + e1, data = datat0)
    mu0f <- predict(mod0f, newdata = datat, type = "response")
    
    mod1f <- lm(y ~ x1 + x2  + e1 , data = datat1)
    mu1f <- predict(mod1f, newdata = datat, type = "response")
    
    # Cross-fitting setup
    folds <- createFolds(datat$y, k = 5, list = TRUE)
    murf0 <- murf1 <- murf0_f <- murf1_f <-rep(NA, nrow(datat)) 
    
    for (k in 1:5) {
      train_idx <- unlist(folds[-k])  # Use all folds except k for training
      valid_idx <- folds[[k]]        # Hold out fold k for validation
      
      train_data <- datat[train_idx, ]
      valid_data <- datat[valid_idx, ]
      
      # Separate treated and untreated data
      train_data_0 <- subset(train_data, tr == 0)
      train_data_1 <- subset(train_data, tr == 1)
      
      #True model
      
      # Train random forest on untreated (Tr == 0)
      model_rf_0 <- ranger(y ~ x1 + x12+ x2 +x22 + x_12 + e2 + e1, data = train_data_0, num.trees = 300, mtry = 2, min.node.size = 5)
      murf0[valid_idx] <- predict(model_rf_0, data = valid_data[, c("x1" , "x12", "x2" , "x22" , "x_12" , "e2" , "e1")])$predictions
      
      # Train random forest on treated (Tr == 1)
      model_rf_1 <- ranger(y ~ x1 + x12+ x2 +x22 + x_12 + e2 + e1, data = train_data_1, num.trees = 300, mtry = 2, min.node.size = 5)
      murf1[valid_idx] <- predict(model_rf_1, data = valid_data[, c("x1" , "x12", "x2" , "x22" , "x_12" , "e2" , "e1")])$predictions
      
      #False model
      
      ### XGBoost for untreated (Tr == 0)
      train_matrix_0 <- xgb.DMatrix(data = as.matrix(train_data_0[, c("x1", "x2","e1")]), 
                                    label = train_data_0$y)
      valid_matrix <- xgb.DMatrix(data = as.matrix(valid_data[, c("x1", "x2", "e1")]))
      model_xgb_0 <- xgboost(data = train_matrix_0, max_depth = 6, eta = 0.05, nrounds = 50, 
                             objective = "reg:squarederror", min_child_weight = 5, subsample = 0.8, 
                             colsample_bytree = 0.8, verbose = 0)
      murf0_f[valid_idx] <- predict(model_xgb_0, valid_matrix)
      
      ### XGBoost for treated (Tr == 1)
      train_matrix_1 <- xgb.DMatrix(data = as.matrix(train_data_1[, c("x1", "x2", "e1")]), 
                                    label = train_data_1$y)
      model_xgb_1 <- xgboost(data = train_matrix_1, max_depth = 6, eta = 0.05, nrounds = 50, 
                             objective = "reg:squarederror", min_child_weight = 5, subsample = 0.8, 
                             colsample_bytree = 0.8, verbose = 0)
      murf1_f[valid_idx] <- predict(model_xgb_1, valid_matrix)
      
      #Fasle non-linear model
      
     
    }
    
    mu02 <- mu0^2
    mu12 <- mu1^2
    mu01 <- mu0*mu1
    mu0f2 <- mu0f^2
    mu1f2 <- mu1f^2
    muf01 <- mu0f*mu1f
    murf02 <- murf0^2
    murf12 <- murf1^2
    murf10 <- murf0*murf1
    
    datat2[[i]] <- as.data.frame(cbind( tr, y, ps, psf1, mu0, mu1, mu0f, mu1f, mu02, mu12, mu01, mu0f2, mu1f2, muf01, murf0, murf1,  murf0_f, murf1_f, murf02, murf12, murf10))
    colnames(datat2[[i]]) <- c( "tr","y","ps", "psf1" ,"mu0", "mu1", "mu0f", "mu1f","mu02", "mu12", "mu01", "mu0f2", "mu1f2", "muf01", "murf0", "murf1", "murf0_f", "murf1_f", "murf02", "murf12", "murf10")
  }
  return(datat2)
}

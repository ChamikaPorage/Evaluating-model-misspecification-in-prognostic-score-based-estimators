#########################
# Simulation 2: DESIGN B#
#########################

#contains function with argument N= sample size and seed,   
#generating 1000 data sets with Design B in Simulation 2

library(xgboost)
library(e1071)
library(caret)
library(ranger)

gen.data.B2 <- function(N, seed){
  set.seed(seed)
  datat2 <- list(0)
  for (i in 1:1000) 
  {
    
    # Propensity score
    x1 <- rnorm(N, 0, 1)
    x2 <- rnorm(N, 0, 1)
    x3 <- runif(N, 0, 1)
    x4 <- rnorm(N, 0, 1)
    # Generate binary effect modifiers
    e1 <- rbinom(N, 1, 0.5)
    e2 <- rbinom(N, 1, 0.5)
    
    x12 <- x1^2
    x22 <- x2^2
    x32 <- x3^2 
    
    
    ap <- -0.90
    bp <- 1
    cp <- 1.4
    dp <- 1
    ep <- 0.2
    fp <- 0.3
    gp <- - 0.65
    hp <- 0.15
    
    prob <- exp(ap + bp * x1 + cp * x2 + dp * x3 + ep * x12 + fp * x22 + gp * e1 + hp * e2)/(1 + exp(ap + bp * x1 + cp * x2 + dp * x3 + ep * x12 + fp * x22 + gp * e1 + hp * e2))
    
    tr <- rbinom(N, 1, prob)
    
    a <- 1
    b <- 1
    c <- 2
    d <- 0.5
    e <- 1
    
    f <- 1.5
    g <- 2
    h <- -0.8
    l <- 0.9
    m <- 0.4
    n <- 2
    
    eps1 <- rnorm(N)
    eps0 <- rnorm(N)
    y1 <- 1.5 + f * x1 + g * x3 + h * x4 + l * x12 + m * x32 + n * tr * e1 + tr * e2 + eps1
    y0 <- a * x1 + b * x3 + c * x4 + d * x12 + e * x32 +  tr * e1 + tr * e2 + eps0
    y  <- ifelse(tr == 1, y1, y0)
    
    datat <- as.data.frame(cbind(x1,  x2,  x3,  x4,  x12,  x22,  x32, e1, e2,  tr,  y0,  y1,  y))
    colnames(datat) <- c("x1",  "x2",  "x3",  "x4",  "x12",  "x22",  "x32", "e1", "e2", "tr",  "y0",  "y1",  "y")
    
    
    # Mispecification for the PS model
    datat$X.sum1 <- datat$x1 + datat$x2 + datat$x3
    # Mispecification for the OR models
    datat$X.sum2 <- datat$x1 + datat$x3 + datat$x4
    
    datat0 <- subset(datat, datat$tr == 0)
    datat1 <- subset(datat, datat$tr == 1)
    
    
    # True PS model
    mod.ps <- glm(tr ~ x1 + x2 + x3 + x12 + x22 + e1 + e2, family = binomial, data = datat)
    ps <- fitted.values(mod.ps,  type="response") 
    datat$ps <- ps
    
    # False PS model
    mod.psf1 <- glm(tr ~ X.sum1 + e1, family = binomial, data = datat)
    psf1 <- fitted.values(mod.psf1, type = "response") 
    datat$psf1 <- psf1
    
    datat0 <- subset(datat, datat$tr == 0)
    datat1 <- subset(datat, datat$tr == 1)
    
    #True OR model
    mod0 <- lm(y ~ x1 + x3 + x4 + x12 + x32 + e1 + e1, data = datat0)
    mu0 <- predict(mod0, newdata = datat, type = "response")
    
    mod1 <- lm(y ~ x1 + x3 + x4 + x12 + x32 + e1 + e1, data = datat1)
    mu1 <- predict(mod1, newdata = datat, type = "response")
    
    # False OR model
    
    mod0f <- lm(y ~ X.sum2 + e1, data = datat0)
    mu0f <- predict(mod0f, newdata = datat, type = "response")
    
    mod1f <- lm(y ~ X.sum2 + e1, data = datat1)
    mu1f <- predict(mod1f, newdata = datat, type = "response")
    
    ###Non-linear model
    
    # Cross-fitting setup
    folds <- createFolds(datat$y, k = 5, list = TRUE)
    murf0 <- murf1 <- murf0_f <- murf1_f <-rep(NA, nrow(datat)) 
    
    for (k in 1:5) {
      train_idx <- unlist(folds[-k])  # Use all folds except k for training
      valid_idx <- folds[[k]]        # Hold out fold k for validation
      
      train_data <- datat[train_idx, ]
      valid_data <- datat[valid_idx, ]
      
      # Separate treated and untreated data
      data0_train <- subset(train_data, tr == 0)
      data1_train <- subset(train_data, tr == 1)
      
      #True non-linear model
      
      # Train random forest on untreated (Tr == 0)
      model_rf_0 <- ranger(y ~ x1 + x3 + x4 + x12 + x32 + e1 + e2, data = data0_train, num.trees = 300, mtry = 2, min.node.size = 5)
      murf0[valid_idx] <- predict(model_rf_0, data = valid_data[, c("x1","x3", "x4", "x12", "x32", "e1", "e2")])$predictions
      
      # Train random forest on treated (Tr == 1)
      model_rf_1 <- ranger(y ~ x1 + x3 + x4 + x12 + x32 + e1 + e2, data = data1_train, num.trees = 300, mtry = 2, min.node.size = 5)
      murf1[valid_idx] <- predict(model_rf_1, data = valid_data[, c("x1","x3", "x4", "x12", "x32", "e1", "e2")])$predictions
      
      #Fasle non-linear model
      
      # Train random forest on untreated (Tr == 0)
      mod_rf_0 <- ranger(y ~ X.sum2 + e1 , data = data0_train, num.trees = 300, mtry = 2, min.node.size = 5)
      murf0_f[valid_idx] <- predict(mod_rf_0, data = valid_data[, c("X.sum2", "e1")])$predictions
      
      # Train random forest on treated (Tr == 1)
      mod_rf_1 <- ranger(y ~ X.sum2 + e1 , data = data1_train, num.trees = 300, mtry = 2, min.node.size = 5)
      murf1_f[valid_idx] <- predict(mod_rf_1, data = valid_data[, c("X.sum2", "e1")])$predictions
      
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
    
    datat2[[i]] <- as.data.frame(cbind(tr, y, ps, psf1, mu0, mu1, mu0f, mu1f, mu02, mu12, mu01, mu0f2, mu1f2, muf01, murf0, murf1,  murf0_f, murf1_f, murf02, murf12, murf10))
    colnames(datat2[[i]]) <- c("tr", "y" ,"ps", "psf1" ,"mu0", "mu1", "mu0f", "mu1f","mu02", "mu12", "mu01", "mu0f2", "mu1f2", "muf01", "murf0", "murf1", "murf0_f", "murf1_f", "murf02", "murfb12", "murf10")
  }
  return(datat2)
}

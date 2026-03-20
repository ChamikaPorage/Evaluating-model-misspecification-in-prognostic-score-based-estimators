#######################
#Simulation1: Design B#
#######################

#contains function with argument N = sample size and seed
# that generates 1000 datasets of Design B,  simulation 1.

library(ranger)
library(caret)

#contains function with argument N = sample size and seed
# that generates 1000 datasets of Design B,  simulation 1.

library(ranger)
library(caret)

gen.data.B <- function(N, seed){
  set.seed(seed)
  datat2 <- vector("list", 1000)
  
  for (i in 1:1000) {
    
    x1 <- runif(N, 1, 5)
    x2 <- runif(N, 1, 5)
    e1 <- rbinom(N, 1, 0.5)
    e2 <- rbinom(N, 1, 0.5)
    
    x12  <- x1^2
    x22  <- x2^2
    x_12 <- x1*x2
    
    a <- 0.8; b <- 0.5; b2 <- -0.15
    c <- 0.5; c2 <- -0.15
    d1 <- -0.15; d2 <- 0.4
    
    eta  <- -(a + b*x1 + b2*x12 + c*x2 + c2*x22 + d1*e1 + d2*e2)
    prob <- plogis(eta)   
    tr   <- rbinom(N, 1, prob)
    
    eps0 <- rnorm(N, 0, 1)
    eps1 <- rnorm(N, 0, 1)
    
    y0 <- 20 - 5*x1 + 2*x12 - 5*x2 + 2*x22 + 4*x_12 + eps0
    y1 <- 22 - 5*x1 + 2*x12 - 5*x2 + 2*x22 + 4*x_12 + e1 + e2 + eps1
    y  <- ifelse(tr == 1, y1, y0)
    
    datat <- data.frame(x1, x12, x2, x22, x_12, tr, e1, e2, y0, y1, y)
    
    datat0 <- subset(datat, tr == 0)
    datat1 <- subset(datat, tr == 1)
    
    # TRUE OR
    mod0 <- lm(y ~ x1 + x12 + x2 + x22 + x_12 + e1 + e2, data = datat0)
    mu0  <- predict(mod0, newdata = datat)
    
    mod1 <- lm(y ~ x1 + x12 + x2 + x22 + x_12 + e1 + e2, data = datat1)
    mu1  <- predict(mod1, newdata = datat)
    
    # FALSE OR
    mod0f <- lm(y ~ x1 + x2 + x_12 + e1, data = datat0)
    mu0f  <- predict(mod0f, newdata = datat)
    
    mod1f <- lm(y ~ x1 + x2 + x_12 + e1, data = datat1)
    mu1f  <- predict(mod1f, newdata = datat)
    
    # Cross-fitting
    folds <- createFolds(datat$y, k = 5, list = TRUE)
    murf0 <- murf1 <- murf0_f <- murf1_f <- rep(NA_real_, nrow(datat))
    
    for (k in 1:5) {
      train_idx <- unlist(folds[-k])
      valid_idx <- folds[[k]]
      
      train_data <- datat[train_idx, ]
      valid_data <- datat[valid_idx, ]
      
      data0_train <- subset(train_data, tr == 0)
      data1_train <- subset(train_data, tr == 1)
      
      model_rf_0 <- ranger(y ~ x1 + x12 + x2 + x22 + x_12 + e1 + e2,
                           data = data0_train, num.trees = 300, mtry = 2, min.node.size = 5)
      murf0[valid_idx] <- predict(model_rf_0, data = valid_data[,c("x1","x12","x2","x22","x_12","e1","e2")])$predictions
      
      model_rf_1 <- ranger(y ~ x1 + x12 + x2 + x22 + x_12 + e1 + e2,
                           data = data1_train, num.trees = 300, mtry = 2, min.node.size = 5)
      murf1[valid_idx] <- predict(model_rf_1, data = valid_data[,c("x1","x12","x2","x22","x_12","e1","e2")])$predictions
      
      mod_rf_0 <- ranger(y ~ x1 + x2 + x_12 + e1, data = data0_train,
                         num.trees = 300, mtry = 2, min.node.size = 5)
      murf0_f[valid_idx] <- predict(mod_rf_0, data = valid_data[,c("x1","x2","x_12","e1")])$predictions
      
      mod_rf_1 <- ranger(y ~ x1  + x2 + x_12 + e1, data = data1_train,
                         num.trees = 300, mtry = 2, min.node.size = 5)
      murf1_f[valid_idx] <- predict(mod_rf_1, data = valid_data[,c("x1","x2","x_12","e1")])$predictions  
    }
    
    datat2[[i]] <- data.frame(tr, y, mu0, mu1, mu0f, mu1f, murf0, murf1, murf0_f, murf1_f)
    colnames(datat2[[i]]) <- c("tr", "y", "mu0", "mu1", "mu0f", "mu1f", "murf0", "murf1", "murf0_f", "murf1_f")
  }
  
  datat2
}

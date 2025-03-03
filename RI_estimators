##############################
# RI ESTIMATORS		             #
##############################

#contains function with argument data 
#that returns the eight pgs - estimators
#under true and misspecified models
library(doParallel)
library(foreach)
library(iterators)
library(parallel)
cl <- makePSOCKcluster(4)
registerDoParallel(cl)

estimators <- function(data) {
  N <- nrow(data[[1]])
  
  ri_pgt <- numeric(1000)
  ri_pgf <- numeric(1000)
  rf_pgt <- numeric(1000)
  rf_pgf <- numeric(1000)  
  ri_fpgt <- numeric(1000)
  ri_fpgf <- numeric(1000)
  rf_fpgt <- numeric(1000)
  rf_fpgf <- numeric(1000)
  
   for (i in 1:1000) {
    datat <- data[[i]]
    if (!is.data.frame(datat)) {
      datat <- as.data.frame(datat)
    }
    colnames(datat) <- c("tr", "y" ,"ps", "psf1" ,"mu0", "mu1", "mu0f", "mu1f","mu02", "mu12", "mu01", "mu0f2", "mu1f2", "muf01", "murf0", "murf1", "murf0_f", "murf1_f", "murf02", "murf12", "murf10")
    
    ri_pgt[i] <- (1 / N) * sum(datat$mu1) - (1 / N) * sum(datat$mu0)
    ri_pgf[i] <- (1 / N) * sum(datat$mu1f) - (1 / N) * sum(datat$mu0f)
    rf_pgt[i] <- (1 / N) * sum(datat$murf1) - (1 / N) * sum(datat$murf0)
    rf_pgf[i] <- (1 / N) * sum(datat$murf1_f) - (1 / N) * sum(datat$murf0_f)
    
    datat1 <- subset(datat, datat$tr == 1)
    datat0 <- subset(datat, datat$tr == 0)
    
    ## Full prognostic score estimators ##
    
    # Linear model #
    
    ### True model ###
    model1 <- lm(y ~ mu1 + mu0 + mu02 + mu12 + mu01, data = datat1)
    pred1 <- predict(model1, newdata = datat)
    
    model0 <- lm(y ~ mu1 + mu0 + mu02 + mu12 + mu01, data = datat0)
    pred0 <- predict(model0, newdata = datat)
    
    #yp <- ifelse(datat$tr == 1, pred1, pred0)
    
    ### Misspecified model ###
    mod1 <- lm(y ~ mu1f + mu0f, data = datat1)
    pre1 <- predict(mod1, newdata = datat)
    
    mod0 <- lm(y ~ mu1f + mu0f, data = datat0)
    pre0 <- predict(mod0, newdata = datat)
    
    #ypf <- ifelse(datat$tr == 1, pre1, pre0)
    
    ri_fpgt[i] <- (1 / N) * sum(pred1) - (1 / N) * sum(pred0)
    ri_fpgf[i] <- (1 / N) * sum(pre1) - (1 / N) * sum(pre0)
    
   ###Non-linear model
    
    # Cross-fitting setup
    folds <- createFolds(datat$y, k = 5, list = TRUE)
    pred0_rf <- pred1_rf <- pre0_rf <- pre1_rf <-rep(NA, nrow(datat)) 
    
    for (k in 1:5) {
      train_idx <- unlist(folds[-k])  # Use all folds except k for training
      valid_idx <- folds[[k]]        # Hold out fold k for validation
      
      train_data <- datat[train_idx, ]
      valid_data <- datat[valid_idx, ]
      
      # Separate treated and untreated data
      train_data_0 <- subset(train_data, tr == 0)
      train_data_1 <- subset(train_data, tr == 1)
      
      # Train random forest on untreated (Tr == 0)
      m_rf_0 <- ranger(y ~ murf1+ murf0 + murf02 + murf12 + murf10, data = train_data_0, num.trees = 300, mtry = 2, min.node.size = 5)
      pred0_rf[valid_idx] <- predict(m_rf_0, data = valid_data)$predictions
      
      # Train random forest on treated (Tr == 1)
      m_rf_1 <- ranger(y ~ murf1+ murf0 + murf02 + murf12 + murf10, data = train_data_1, num.trees = 300, mtry = 2, min.node.size = 5)
      pred1_rf[valid_idx] <- predict(m_rf_1, data = valid_data)$predictions
      
      #Fasle non-linear model
      # Train random forest on untreated (Tr == 0)
      m_rf_0f <- ranger(y ~ murf1_f + murf0_f, data = train_data_0, num.trees = 300, mtry = 2, min.node.size = 5)
      pre0_rf[valid_idx] <- predict(m_rf_0f, data = valid_data)$predictions
      
      # Train random forest on treated (Tr == 1)
      m_rf_1f <- ranger(y ~ murf1_f + murf0_f, data = train_data_1, num.trees = 300, mtry = 2, min.node.size = 5)
      pre1_rf[valid_idx] <- predict(m_rf_1f, data = valid_data)$predictions
      
      
    }
    
    rf_fpgt[i] <- (1 / N) * sum(pred1_rf) - (1 / N) * sum(pred0_rf)
    rf_fpgf[i] <- (1 / N) * sum(pre1_rf) - (1 / N) * sum(pre0_rf)
    
  }
  
  return(cbind(ri_pgt, ri_pgf,rf_pgt,rf_pgf, ri_fpgt, ri_fpgf,rf_fpgt, rf_fpgf))
}

##############################
# AIPW ESTIMATORS		         #
##############################

#contains function with argument data 
#that returns the two pgs - estimators
#under true and misspecified models
library(doParallel)
library(foreach)
library(iterators)
library(parallel)
cl <- makePSOCKcluster(4)
registerDoParallel(cl)

estimators_aipw <- function(data) {
  N <- nrow(data[[1]])
  
  dr_pt <- numeric(1000)
  dr_p_tp <- numeric(1000)
  dr_p_to <- numeric(1000)
  dr_pf <- numeric(1000)
  dr_pt_n <- numeric(1000)
  dr_p_tp_n <- numeric(1000)
  dr_p_to_n <- numeric(1000)
  dr_pf_n <- numeric(1000)
  dr_ft <- numeric(1000)
  dr_f_tp <- numeric(1000)
  dr_f_to <- numeric(1000)
  dr_ff <- numeric(1000)
  dr_ft_n <- numeric(1000)
  dr_f_tp_n <- numeric(1000)
  dr_f_to_n <- numeric(1000)
  dr_ff_n <- numeric(100)
  
  for (i in 1:1000) {
    datat <- data[[i]]
    if (!is.data.frame(datat)) {
      datat <- as.data.frame(datat)
    }
    colnames(datat) <- c("tr", "y" ,"ps", "psf1" ,"mu0", "mu1", "mu0f", "mu1f","mu02", "mu12", "mu01", "mu0f2", "mu1f2", "muf01", "murf0", "murf1", "murf0_f", "murf1_f", "murf02", "murf12", "murf10")
    
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
    #ypf <- ifelse(datat$tr == 1, pre1, pre0)
    
    ### Doubly robust estimators ###
    
    ###PGS estimators###
    
    ##linear models ###
    
    dr_pt[i] <- (1 / N) * sum(((datat$tr * datat$y) - (datat$tr - datat$ps) * datat$mu1) / datat$ps) - 
      (1 / N) * sum(((1 - datat$tr) * datat$y + (datat$tr - datat$ps) * datat$mu0) / (1 - datat$ps))
    
    #True PS False OR#
    dr_p_tp[i] <- (1 / N) * sum(((datat$tr * datat$y) - (datat$tr - datat$ps) * datat$mu1f) / datat$ps) - 
      (1 / N) * sum(((1 - datat$tr) * datat$y + (datat$tr - datat$ps) * datat$mu0f) / (1 - datat$ps))
    
     #True OR False PS#
    dr_p_to[i] <- (1 / N) * sum(((datat$tr * datat$y) - (datat$tr - datat$psf1) * datat$mu1) / datat$psf1) - 
      (1 / N) * sum(((1 - datat$tr) * datat$y + (datat$tr - datat$psf1) * datat$mu0) / (1 - datat$psf1))
    
    dr_pf[i] <- (1 / N) * sum(((datat$tr * datat$y) - (datat$tr - datat$psf1) * datat$mu1f) / datat$psf1) - 
      (1 / N) * sum(((1 - datat$tr) * datat$y + (datat$tr - datat$psf1) * datat$mu0f) / (1 - datat$psf1))
    
    ##non-linear models ###
    
    #True PS True OR#
    dr_pt_n[i] <- (1 / N) * sum(((datat$tr * datat$y) - (datat$tr - datat$ps) * datat$murf1) / datat$ps) - 
      (1 / N) * sum(((1 - datat$tr) * datat$y + (datat$tr - datat$ps) * datat$murf0) / (1 - datat$ps))
    
    #True PS False OR#
    dr_p_tp_n[i] <- (1 / N) * sum(((datat$tr * datat$y) - (datat$tr - datat$ps) * datat$murf1_f) / datat$ps) - 
      (1 / N) * sum(((1 - datat$tr) * datat$y + (datat$tr - datat$ps) * datat$murf0_f) / (1 - datat$ps))
    
    #True OR False PS#
    dr_p_to_n[i] <- (1 / N) * sum(((datat$tr * datat$y) - (datat$tr - datat$psf1) * datat$murf1) / datat$psf1) - 
      (1 / N) * sum(((1 - datat$tr) * datat$y + (datat$tr - datat$psf1) * datat$murf0) / (1 - datat$psf1))
    
    #False PS False OR#
    dr_pf_n[i] <- (1 / N) * sum(((datat$tr * datat$y) - (datat$tr - datat$psf1) * datat$murf1_f) / datat$psf1) - 
      (1 / N) * sum(((1 - datat$tr) * datat$y + (datat$tr - datat$psf1) * datat$murf0_f) / (1 - datat$psf1))
    
    #dat <- as.data.frame(cbind(datat$tr,datat$y, datat$mu0, datat$mu1, datat$mu0f, datat$mu1f, datat$mu02, datat$mu12, datat$mu01, datat$mu0f2, datat$mu1f2, datat$muf01, pred1, pred0, pre0, pre1))
    #colnames(dat) <- c("tr", "y","mu0", "mu1", "mu0f", "mu1f", "mu02", "mu12", "mu01", "mu0f2", "mu1f2", "muf01", "pred1", "pred0", "pre0", "pre1")
    
    #mod.ps_g <- glm(tr ~ mu1 + mu0 , family = binomial, data = dat)
    #ps_g <- predict(mod.ps_g, type = "response")
    
    #mod.psf_g <- glm(tr ~ mu1f + mu0f , family = binomial(link = "logit"), data = dat)
    #psf_g <- predict(mod.psf_g, type = "response")
    
    #FPGS estimators
    #True PS TRUE OR#
    dr_ft[i] <- (1 / N) * sum(((datat$tr * datat$y) - (datat$tr - datat$ps) * pred1) / datat$ps) - 
      (1 / N) * sum(((1 - datat$tr) * datat$y + (datat$tr - datat$ps) * pred0) / (1 - datat$ps))
    
     #True PS False OR#
    dr_f_tp[i] <- (1 / N) * sum(((datat$tr * datat$y) - (datat$tr - datat$ps) * pre1) / datat$ps) - 
      (1 / N) * sum(((1 - datat$tr) * datat$y + (datat$tr - datat$ps) * pre0) / (1 - datat$ps))
    
    #True OR False PS#
    dr_f_to[i] <- (1 / N) * sum(((datat$tr * datat$y) - (datat$tr - datat$psf1) * pred1) / datat$psf1) - 
      (1 / N) * sum(((1 - datat$tr) * datat$y + (datat$tr - datat$psf1) * pred0) / (1 - datat$psf1))
    
    #False OR False PS#
    dr_ff[i] <- (1 / N) * sum(((datat$tr * datat$y) - (datat$tr - datat$psf1) * pre1) / datat$psf1) - 
      (1 / N) * sum(((1 - datat$tr) * datat$y + (datat$tr - datat$psf1) * pre0) / (1 - datat$psf1))
    
    #Non-linear estimators
    dr_ft_n[i] <- (1 / N) * sum(((datat$tr * datat$y) - (datat$tr - datat$ps) * pred1_rf) / datat$ps) - 
      (1 / N) * sum(((1 - datat$tr) * datat$y + (datat$tr - datat$ps) * pred0_rf) / (1 - datat$ps))
    
    #True PS False OR#
    dr_f_tp_n[i] <- (1 / N) * sum(((datat$tr * datat$y) - (datat$tr - datat$ps) * pre1_rf) / datat$ps) - 
      (1 / N) * sum(((1 - datat$tr) * datat$y + (datat$tr - datat$ps) * pre0_rf) / (1 - datat$ps))
    
    #True OR False PS#
    dr_f_to_n[i] <- (1 / N) * sum(((datat$tr * datat$y) - (datat$tr - datat$psf1) * pred1_rf) / datat$psf1) - 
      (1 / N) * sum(((1 - datat$tr) * datat$y + (datat$tr - datat$psf1) * pred0_rf) / (1 - datat$psf1))
    
    #False OR False PS#
    dr_ff_n[i] <- (1 / N) * sum(((datat$tr * datat$y) - (datat$tr - datat$psf1) * pre1_rf) / datat$psf1) - 
      (1 / N) * sum(((1 - datat$tr) * datat$y + (datat$tr - datat$psf1) * pre0_rf) / (1 - datat$psf1))
    
    
  }
  
  return(cbind( dr_pt, dr_p_tp, dr_p_to, dr_pf, dr_pt_n, dr_p_tp_n, dr_p_to_n, dr_pf_n, dr_ft, dr_f_tp, dr_f_to, dr_ff, dr_ft_n, dr_f_tp_n, dr_f_to_n, dr_ff_n))
}

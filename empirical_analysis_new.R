#load required packages
library(devtools)
library(boot)
library(MASS) 
library(randomForest)
library(rpart)
library(xtable)
library(PSW)
library(iWeigReg)
library(cobalt)
library(WeightIt)
library(table1)
library(readxl)
library(caret)
library(xgboost)
library(dplyr)
library(ranger)
#read data from dfmale.csv and for_table8.csv
datat <- read.csv(file = "F:\\Users\\chapo752\\Dropbox\\Second paper\\R codes\\Empirical analysis\\dfmale.csv")

#covariates
X.matrix <- model.matrix(smoking ~ married.living.with.partner + birth.country + edu + race + income + army.service + bmi  + c.age + c.age2 + c.family.size, data = datat)

dat.X <- as.data.frame(X.matrix)
dat.X <- dat.X[,-1]
colnames(dat.X)
dat.X <- dat.X[, !names(dat.X) %in% "incomeOther"]
names(dat.X) <- c(LETTERS[1:26])

dat <- cbind(datat$smoking, datat$lead, dat.X)

names(dat) <- c("smoking", "lead", LETTERS[1:26])


#PS MODELS

#true ps
mod.ps <- glm(smoking ~ A+B+C+D+E+F+G+H+I+J+K+L+M+N+O+P+Q+R+S+T+U+V+W+X+Y+Z, family = binomial, data = dat)
ps <- fitted.values(mod.ps, type = "response") 
datat$ps <- ps

#false ps
mod.psf1 <- glm(smoking ~ B+C+D+E+F+G+H+I+J+K+L+M+O+P+R+S+T+U+X+Z, family = binomial(link = "logit"), data = dat)
psf1 <- fitted.values(mod.psf1, type = "response") 
datat$psf1 <- psf1

# Subsetting data
data0 <- subset(dat, smoking == 0)
data1 <- subset(dat, smoking == 1)

#Outcome Regression models(prognostic scores)

#TRUE OR
mod0 <- lm(lead ~ A+B+C+D+E+F+G+H+I+J+K+L+M+N+O+P+Q+R+S+T+U+V+W+X+Y+Z, data = data0)
mu0 <- predict(mod0, newdata = dat, type = "response")

mod1 <- lm(lead ~ A+B+C+D+E+F+G+H+I+J+K+L+M+N+O+P+Q+R+S+T+U+V+W+X+Y+Z, data = data1)
mu1 <- predict(mod1, newdata = dat, type = "response")

#FALSE OR

mod0f <- lm(lead ~ B+C+D+E+F+G+H+I+J+K+L+M+N+O+P+R+S+T+U+X+Z, data = data0)
mu0f <- predict(mod0f, newdata = dat, type = "response")

mod1f <- lm(lead ~ B+C+D+E+F+G+H+I+J+K+L+M+N+O+P+R+S+T+U+X+Z, data = data1)
mu1f <- predict(mod1f, newdata = dat, type = "response")


###Non-linear models###

folds <- createFolds(dat$lead, k = 5, list = TRUE)

# Initializing prediction vectors

N <- nrow(dat)
p0rf <- p1rf <- p0rf_f <- p1rf_f <- rep(NA, nrow(dat))


for (k in 1:5) {
  # Training and validation indices for fold k
  train_id <- unlist(folds[-k])  # Use all folds except fold k for training
  test_id <- folds[[k]]          # Use fold k for testing
  
  # Separate training and validation data
  train_data <- dat[train_id, ]
  test_data <- dat[test_id, ]
  
  # Subset training data into treatment groups
  data0_train <- subset(train_data, smoking == 0)
  data1_train <- subset(train_data, smoking == 1)
  
  # True model
  
  # Train random forest on untreated group (smoking == 0)
  model_rf_0 <- ranger(lead ~ A+B+C+D+E+F+G+H+I+J+K+L+M+N+O+P+Q+R+S+T+U+V+W+X+Y+Z, 
                       data = data0_train, 
                       num.trees = 300, 
                       mtry = 2)
  p0rf[test_id] <- predict(model_rf_0, data = test_data[, !(colnames(test_data) %in% c("smoking", "lead"))])$predictions
  
  # Train random forest on treated group (smoking == 1)
  model_rf_1 <- ranger(lead ~ A+B+C+D+E+F+G+H+I+J+K+L+M+N+O+P+Q+R+S+T+U+V+W+X+Y+Z, 
                             data = data1_train, 
                             num.trees = 300, 
                             mtry = 2)
  p1rf[test_id] <- predict(model_rf_1, data = test_data[, !(colnames(test_data) %in% c("smoking", "lead"))])$predictions
                           
  
  # False model
  # Prepare data matrices for XGBoost
  train_matrix_0 <- xgb.DMatrix(
    data = as.matrix(data0_train[, !(colnames(data0_train) %in% c("smoking", "lead" ,"Q", "W", "Y"))]), 
    label = data0_train$lead
  )
  
  train_matrix_1 <- xgb.DMatrix(
    data = as.matrix(data1_train[, !(colnames(data1_train) %in% c("smoking", "lead", "Q", "W", "Y"))]), 
    label = data1_train$lead
  )
  
  test_matrix <- xgb.DMatrix(
    data = as.matrix(test_data[, !(colnames(test_data) %in% c("smoking", "lead", "Q", "W", "Y"))])
  )
  
  # Train XGBoost on untreated group (smoking == 0)
  model_xgb_0 <- xgboost(data = train_matrix_0, max_depth = 6, eta = 0.05, nrounds = 50, 
                         objective = "reg:squarederror", min_child_weight = 5, subsample = 0.8, 
                         colsample_bytree = 0.8, verbose = 0)
  p0rf_f[test_id] <- predict(model_xgb_0, test_matrix)
  
  # Train XGBoost on treated group (smoking == 1)
  model_xgb_1 <- xgboost(data = train_matrix_1, max_depth = 6, eta = 0.05, nrounds = 50, 
                         objective = "reg:squarederror", min_child_weight = 5, subsample = 0.8, 
                         colsample_bytree = 0.8, verbose = 0)
  p1rf_f[test_id] <- predict(model_xgb_1, test_matrix)
}

# quadratic and interaction terms
mu02 <- mu0^2
mu12 <- mu1^2
mu01 <- mu0*mu1
p0rf2 <- p0rf^2
p1rf2 <- p1rf^2
prf10 <- p0rf*p1rf

Dat<-cbind.data.frame(dat$lead,dat$smoking,ps, psf1, mu0,mu1,mu02,mu12,mu01,mu0f,mu1f,p0rf,p1rf,p1rf2,p0rf2,prf10,p0rf_f,p1rf_f)
colnames(Dat) <- c('lead','smoking','ps', 'psf1','mu0','mu1','mu02','mu12','mu01','mu0f','mu1f','p0rf','p1rf','p1rf2','p0rf2','prf10','p0rf_f','p1rf_f')

#Outcome Regression models(full prognostic scores)

Dat1 <- subset(Dat, Dat$smoking == 1)
Dat0 <- subset(Dat, Dat$smoking == 0)

###FPGS estimators

# Linear model #

### True model ###
model1 <- lm(lead ~ mu1 + mu0 + mu02 + mu12 + mu01, data = Dat1)
pred1 <- predict(model1, newdata = Dat)

model0 <- lm(lead ~ mu1 + mu0 + mu02 + mu12 + mu01, data = Dat0)
pred0 <- predict(model0, newdata = Dat)

yp <- ifelse(Dat$smoking == 1, pred1, pred0)

### Misspecified model ###
mod1 <- lm(lead ~ mu1f + mu0f, data = Dat1)
pre1 <- predict(mod1, newdata = Dat)

mod0 <- lm(lead ~ mu1f + mu0f, data = Dat0)
pre0 <- predict(mod0, newdata = Dat)

ypf <- ifelse(Dat$smoking == 1, pre1, pre0)

# Non-linear model #

# Initializing prediction vectors

N <- nrow(dat)
pred1_rf <- pred0_rf <- pre1f_rf <- pre0f_rf <- rep(NA, N)

for (k in 1:5) {
  # Training and validation indices for fold k
  train_id <- unlist(folds[-k])
  test_id <- folds[[k]]
  
  # Separate training and validation data
  train_data <- Dat[train_id, ]
  test_data <- Dat[test_id, ]
  
  # Subset training data into treatment groups
  data0_train <- subset(train_data, smoking == 0)
  data1_train <- subset(train_data, smoking == 1)
  
  # True model 
  
  # Train Random Forest on untreated group
  model_rf_0 <- ranger(lead ~ p0rf +  p1rf + p1rf2 + p0rf2 + prf10, data = data0_train, num.tree = 300, mtry = 2)
  pred0_rf[test_id] <- predict(model_rf_0, data = test_data[,c("p0rf" ,"p1rf","p1rf2","p0rf2","prf10")])$predictions
  
  # Train Random Forest on treated group
  model_rf_1 <- ranger(lead ~ p0rf +  p1rf + p1rf2 + p0rf2 + prf10,, data = data1_train, num.tree = 300, mtry = 2)
  pred1_rf[test_id] <- predict(model_rf_1, data = test_data[,c("p0rf" ,"p1rf","p1rf2","p0rf2","prf10")])$predictions
  
  # False model (XGBoost)
  train_matrix_0 <- xgb.DMatrix(data = as.matrix(data0_train[, c("p0rf_f", "p1rf_f")]), label = data0_train$lead)
  train_matrix_1 <- xgb.DMatrix(data = as.matrix(data1_train[, c("p0rf_f", "p1rf_f")]), label = data1_train$lead)
  test_matrix <- xgb.DMatrix(data = as.matrix(test_data[, c("p0rf_f", "p1rf_f")]))
  
  # Train XGBoost on untreated group
  model_xgb_0 <- xgboost(data = train_matrix_0, max_depth = 6, eta = 0.05, nrounds = 50, objective = "reg:squarederror",
                         min_child_weight = 5, subsample = 0.8, colsample_bytree = 0.8, verbose = 0)
  pre0f_rf[test_id] <- predict(model_xgb_0, test_matrix)
  
  # Train XGBoost on treated group
  model_xgb_1 <- xgboost(data = train_matrix_1, max_depth = 6, eta = 0.05, nrounds = 50, objective = "reg:squarederror",
                         min_child_weight = 5, subsample = 0.8, colsample_bytree = 0.8, verbose = 0)
  pre1f_rf[test_id] <- predict(model_xgb_1, test_matrix)
  
}

# propensity score for full prognostic scores
#mod.ps_g <- glm(smoking ~ mu1 + mu0 , family = binomial, data = dat)
#ps_g <- predict(mod.ps_g, type = "response")

#mod.psf_g <- glm(smoking ~ mu1f + mu0f , family = binomial(link = "logit"), data = dat)
#psf_g <- predict(mod.psf_g, type = "response")

Dat_t<-cbind.data.frame(dat$lead,dat$smoking,ps, psf1, mu0,mu1,mu02,mu12,mu01,mu0f,mu1f,p0rf,p1rf,p1rf2,p0rf2,prf10,p0rf_f,p1rf_f, pred1, pred0, pre1, pre0, pred1_rf, pred0_rf, pre1f_rf, pre0f_rf)
colnames(Dat_t) <- c('lead','smoking','ps', 'psf1','mu0','mu1','mu02','mu12','mu01','mu0f','mu1f','p0rf', 'p1rf','p1rf2','p0rf2', 'prf10', 'p0rf_f', 'p1rf_f', 'pred1' , 'pred0', 'pre1', 'pre0', 'pred1_rf', 'pred0_rf', 'pre1f_rf', 'pre0f_rf')
Dat_t
### Estimators

###PGS estimators

#Linear models

#1.True-linear
ri_pgt <- mean(Dat_t$mu1) - mean(Dat_t$mu0)
#2.False-linear
ri_pgf <- mean(Dat_t$mu1f) - mean(Dat_t$mu0f)
#3.True-non-linear
rf_pgt <- mean(Dat_t$p1rf) - mean(Dat_t$p0rf)
#4.False non-linear
rf_pgf <- mean(Dat_t$p1rf_f) - mean(Dat_t$p0rf_f)

###FPGS estimators

#5.True-linear
ri_fpgt <- mean(pred1) - mean(pred0)
#6.False-linear
ri_fpgf <- mean(pre1) - mean(pre0)
#7.True non-linear
rf_fpgt <- mean(pred1_rf) - mean(pred0_rf)
#8.False non-linear
rf_fpgf <- mean(pre1f_rf) - mean(pre0f_rf)

### Doubly robust estimators ###

#PGS estimators (with OLS OR model)

#.9-true model
dr_pt <- mean(((Dat_t$smoking * Dat_t$lead) - (Dat_t$smoking - Dat_t$ps) * Dat_t$mu1) / Dat_t$ps) - 
  mean(((1 - Dat_t$smoking) * Dat_t$lead + (Dat_t$smoking - Dat_t$ps) * Dat_t$mu0) / (1 - Dat_t$ps))
#.10-false model
dr_pf <- mean(((Dat_t$smoking * Dat_t$lead) - (Dat_t$smoking - Dat_t$psf1) * Dat_t$mu1f) / Dat_t$psf1) - 
  mean(((1 - Dat_t$smoking) * Dat_t$lead + (Dat_t$smoking - Dat_t$psf1) * Dat_t$mu0f) / (1 - Dat_t$psf1))

#.11-True OR, False PS
dr_p_to_fp <- mean(((Dat_t$smoking * Dat_t$lead) - (Dat_t$smoking - Dat_t$psf1) * Dat_t$mu1) / Dat_t$psf1) - 
  mean(((1 - Dat_t$smoking) * Dat_t$lead + (Dat_t$smoking - Dat_t$psf1) * Dat_t$mu0) / (1 - Dat_t$psf1))
#.12-False OR, True PS
dr_p_fo_tp <- mean(((Dat_t$smoking * Dat_t$lead) - (Dat_t$smoking - Dat_t$ps) * Dat_t$mu1f) / Dat_t$ps) - 
  mean(((1 - Dat_t$smoking) * Dat_t$lead + (Dat_t$smoking - Dat_t$ps) * Dat_t$mu0f) / (1 - Dat_t$ps))

#PGS estimators (with RF OR model)
#.13-true model
dr_pt_n <- mean(((Dat_t$smoking * Dat_t$lead) - (Dat_t$smoking - Dat_t$ps) * Dat_t$p1rf) / Dat_t$ps) - 
  mean(((1 - Dat_t$smoking) * Dat_t$lead + (Dat_t$smoking - Dat_t$ps) * Dat_t$p0rf) / (1 - Dat_t$ps))
#.14-false model
dr_pf_n <- mean(((Dat_t$smoking * Dat_t$lead) - (Dat_t$smoking - Dat_t$psf1) * Dat_t$p1rf_f) / Dat_t$psf1) - 
  mean(((1 - Dat_t$smoking) * Dat_t$lead + (Dat_t$smoking - Dat_t$psf1) * Dat_t$p0rf_f) / (1 - Dat_t$psf1))

#.15-True OR, False PS
dr_p_to_fp_n <- mean(((Dat_t$smoking * Dat_t$lead) - (Dat_t$smoking - Dat_t$psf1) * Dat_t$p1rf) / Dat_t$psf1) - 
  mean(((1 - Dat_t$smoking) * Dat_t$lead + (Dat_t$smoking - Dat_t$psf1) * Dat_t$p0rf) / (1 - Dat_t$psf1))
#.16-False OR, True PS
dr_p_fo_tp_n <- mean(((Dat_t$smoking * Dat_t$lead) - (Dat_t$smoking - Dat_t$ps) * Dat_t$p1rf_f) / Dat_t$ps) - 
  mean(((1 - Dat_t$smoking) * Dat_t$lead + (Dat_t$smoking - Dat_t$ps) * Dat_t$p0rf_f) / (1 - Dat_t$ps))


#FPGS estimators (with OLS OR model)

#.17-true model
dr_ft <- mean(((Dat_t$smoking * Dat_t$lead) - (Dat_t$smoking - Dat_t$ps) * Dat_t$pred1) / Dat_t$ps) - 
  mean(((1 - Dat_t$smoking) * Dat_t$lead + (Dat_t$smoking - Dat_t$ps) * Dat_t$pred0) / (1 - Dat_t$ps))

#.18-False model
dr_ff <- mean(((Dat_t$smoking * Dat_t$lead) - (Dat_t$smoking - Dat_t$psf1) * Dat_t$pre1) / Dat_t$psf1) - 
  mean(((1 - Dat_t$smoking) * Dat_t$lead + (Dat_t$smoking - Dat_t$psf1) * Dat_t$pre0) / (1 - Dat_t$psf1))

#.19-True OR, False PS
dr_f_to_fp <- mean(((Dat_t$smoking * Dat_t$lead) - (Dat_t$smoking - Dat_t$psf1) * Dat_t$pred1) / Dat_t$psf1) - 
  mean(((1 - Dat_t$smoking) * Dat_t$lead + (Dat_t$smoking - Dat_t$psf1) * Dat_t$pred0) / (1 - Dat_t$psf1))

#.20-False OR, True PS
dr_f_fo_tp <- mean(((Dat_t$smoking * Dat_t$lead) - (Dat_t$smoking - Dat_t$ps) * Dat_t$pre1) / Dat_t$ps) - 
  mean(((1 - Dat_t$smoking) * Dat_t$lead + (Dat_t$smoking - Dat_t$ps) * Dat_t$pre0) / (1 - Dat_t$ps))

#FPGS estimators (with RF OR model)

#.21-true model
dr_ft_n <- mean(((Dat_t$smoking * Dat_t$lead) - (Dat_t$smoking - Dat_t$ps) * Dat_t$pred1_rf) / Dat_t$ps) - 
  mean(((1 - Dat_t$smoking) * Dat_t$lead + (Dat_t$smoking - Dat_t$ps) * Dat_t$pred0_rf) / (1 - Dat_t$ps))

#.22-False model
dr_ff_n <- mean(((Dat_t$smoking * Dat_t$lead) - (Dat_t$smoking - Dat_t$psf1) * Dat_t$pre1f_rf) / Dat_t$psf1) - 
  mean(((1 - Dat_t$smoking) * Dat_t$lead + (Dat_t$smoking - Dat_t$psf1) * Dat_t$pre0f_rf) / (1 - Dat_t$psf1))

#.23-True OR, False PS
dr_f_to_fp_n <- mean(((Dat_t$smoking * Dat_t$lead) - (Dat_t$smoking - Dat_t$psf1) * Dat_t$pred1_rf) / Dat_t$psf1) - 
  mean(((1 - Dat_t$smoking) * Dat_t$lead + (Dat_t$smoking - Dat_t$psf1) * Dat_t$pred0_rf) / (1 - Dat_t$psf1))

#.24-False OR, True PS
dr_f_fo_tp_n <- mean(((Dat_t$smoking * Dat_t$lead) - (Dat_t$smoking - Dat_t$ps) * Dat_t$pre1f_rf) / Dat_t$ps) - 
  mean(((1 - Dat_t$smoking) * Dat_t$lead + (Dat_t$smoking - Dat_t$ps) * Dat_t$pre0f_rf) / (1 - Dat_t$ps))
                                                                                   
# Load the necessary library for bootstrap
library(boot)

# Set the number of bootstrap samples
num_bootstrap_samples <- 1000

### Define bootstrap functions for each of the 12 estimators

### 1. True-linear PGS (ri_pgt)
boot_ri_pgt <- function(data, indices) {
  data_s <- data[indices, ]
  ri_pgt <- mean(data_s$mu1) - mean(data_s$mu0)
  return(ri_pgt)
}

### 2. False-linear PGS (ri_pgf)
boot_ri_pgf <- function(data, indices) {
  data_s <- data[indices, ]
  ri_pgf <- mean(data_s$mu1f) - mean(data_s$mu0f)
  return(ri_pgf)
}

### 3. True-non-linear PGS (rf_pgt)
boot_rf_pgt <- function(data, indices) {
  data_s <- data[indices, ]
  rf_pgt <- mean(data_s$p1rf) - mean(data_s$p0rf)
  return(rf_pgt)
}

### 4. False-non-linear PGS (rf_pgf)
boot_rf_pgf <- function(data, indices) {
  data_s <- data[indices, ]
  rf_pgf <- mean(data_s$p1rf_f) - mean(data_s$p0rf_f)
  return(rf_pgf)
}

### 5. True-linear FPGS (ri_fpgt)
boot_ri_fpgt <- function(data, indices) {
  data_s <- data[indices, ]
  ri_fpgt <- mean(data_s$pred1) - mean(data_s$pred0)
  return(ri_fpgt)
}

### 6. False-linear FPGS (ri_fpgf)
boot_ri_fpgf <- function(data, indices) {
  data_s <- data[indices, ]
  ri_fpgf <- mean(data_s$pre1) - mean(data_s$pre0)
  return(ri_fpgf)
}

### 7. True-non-linear FPGS (rf_fpgt)
boot_rf_fpgt <- function(data, indices) {
  data_s <- data[indices, ]
  rf_fpgt <- mean(data_s$pred1_rf) - mean(data_s$pred0_rf)
  return(rf_fpgt)
}

### 8. False-non-linear FPGS (rf_fpgf)
boot_rf_fpgf <- function(data, indices) {
  data_s <- data[indices, ]
  rf_fpgf <- mean(data_s$pre1f_rf) - mean(data_s$pre0f_rf)
  return(rf_fpgf)
}

### 9. Doubly Robust:PGS - True OR, True PS (dr_pt)
boot_dr_pt <- function(data, indices) {
  data_s <- data[indices, ]
  dr_pt <- mean(((data_s$smoking * data_s$lead) - (data_s$smoking - data_s$ps) * data_s$mu1) / data_s$ps) - 
    mean(((1 - data_s$smoking) * data_s$lead + (data_s$smoking - data_s$ps) * data_s$mu0) / (1 - data_s$ps))
  return(dr_pt)
}

### 10. Doubly Robust:PGS - True OR, False PS (dr_p_to_fp)
boot_dr_p_to_fp <- function(data, indices) {
  data_s <- data[indices, ]
  dr_p_to_fp <- mean(((data_s$smoking * data_s$lead) - (data_s$smoking - data_s$psf1) * data_s$mu1) / data_s$psf1) - 
    mean(((1 - data_s$smoking) * data_s$lead + (data_s$smoking - data_s$psf1) * data_s$mu0) / (1 - data_s$psf1))
  return(dr_p_to_fp)
}

### 11. Doubly Robust:PGS - False OR, True PS (dr_p_fo_tp)
boot_dr_p_fo_tp <- function(data, indices) {
  data_s <- data[indices, ]
  dr_p_fo_tp <- mean(((data_s$smoking * data_s$lead) - (data_s$smoking - data_s$ps) * data_s$mu1f) / data_s$ps) - 
    mean(((1 - data_s$smoking) * data_s$lead + (data_s$smoking - data_s$ps) * data_s$mu0f) / (1 - data_s$ps))
  return(dr_p_fo_tp)
}

### 12. Doubly Robust:PGS - False OR, FALSE PS  (dr_pf)
boot_dr_pf <- function(data, indices) {
  data_s <- data[indices, ]
  dr_pf <- mean(((data_s$smoking * data_s$lead) - (data_s$smoking - data_s$psf1) * data_s$mu1f) / data_s$psf1) - 
    mean(((1 - data_s$smoking) * data_s$lead + (data_s$smoking - data_s$psf1) * data_s$mu0f) / (1 - data_s$psf1))
  return(dr_pf)
}

#RF OR model (non-parametric)

### 13. Doubly Robust:PGS - True OR, True PS (dr_pt)
boot_dr_pt_n <- function(data, indices) {
  data_s <- data[indices, ]
  dr_pt_n <- mean(((data_s$smoking * data_s$lead) - (data_s$smoking - data_s$ps) * data_s$p1rf) / data_s$ps) - 
    mean(((1 - data_s$smoking) * data_s$lead + (data_s$smoking - data_s$ps) * data_s$p0rf) / (1 - data_s$ps))
  return(dr_pt_n)
}

### 14. Doubly Robust:PGS - True OR, False PS (dr_p_to_fp)
boot_dr_p_to_fp_n <- function(data, indices) {
  data_s <- data[indices, ]
  dr_p_to_fp_n <- mean(((data_s$smoking * data_s$lead) - (data_s$smoking - data_s$psf1) * data_s$p1rf) / data_s$psf1) - 
    mean(((1 - data_s$smoking) * data_s$lead + (data_s$smoking - data_s$psf1) * data_s$p0rf) / (1 - data_s$psf1))
  return(dr_p_to_fp_n)
}

### 15. Doubly Robust:PGS - False OR, True PS (dr_p_fo_tp)
boot_dr_p_fo_tp_n <- function(data, indices) {
  data_s <- data[indices, ]
  dr_p_fo_tp_n <- mean(((data_s$smoking * data_s$lead) - (data_s$smoking - data_s$ps) * data_s$p1rf_f) / data_s$ps) - 
    mean(((1 - data_s$smoking) * data_s$lead + (data_s$smoking - data_s$ps) * data_s$p0rf_f) / (1 - data_s$ps))
  return(dr_p_fo_tp_n)
}

### 16. Doubly Robust:PGS - False OR, FALSE PS  (dr_pf)
boot_dr_pf_n <- function(data, indices) {
  data_s <- data[indices, ]
  dr_pf_n <- mean(((data_s$smoking * data_s$lead) - (data_s$smoking - data_s$psf1) * data_s$p1rf_f) / data_s$psf1) - 
    mean(((1 - data_s$smoking) * data_s$lead + (data_s$smoking - data_s$psf1) * data_s$p0rf_f) / (1 - data_s$psf1))
  return(dr_pf_n)
}

####FPGS estimators

### 17. Doubly Robust:FPGS - True FPGS (dr_ft)
boot_dr_ft <- function(data, indices) {
  data_s <- data[indices, ]
  dr_ft <- mean(((data_s$smoking * data_s$lead) - (data_s$smoking - data_s$ps) * data_s$pred1) / data_s$ps) - 
    mean(((1 - data_s$smoking) * data_s$lead + (data_s$smoking - data_s$ps) * data_s$pred0) / (1 - data_s$ps))
  return(dr_ft)
}

### 18. Doubly Robust:FPGS - True OR, False PS (dr_f_to_fp)
boot_dr_f_to_fp <- function(data, indices) {
  data_s <- data[indices, ]
  dr_f_to_fp <- mean(((data_s$smoking * data_s$lead) - (data_s$smoking - data_s$psf1) * data_s$pred1) / data_s$psf1) - 
    mean(((1 - data_s$smoking) * data_s$lead + (data_s$smoking - data_s$psf1) * data_s$pred0) / (1 - data_s$psf1))
  return(dr_f_to_fp)
}

### 19. Doubly Robust:PGS - False OR, True PS (dr_f_fo_tp)
boot_dr_f_fo_tp <- function(data, indices) {
  data_s <- data[indices, ]
  dr_f_fo_tp <- mean(((data_s$smoking * data_s$lead) - (data_s$smoking - data_s$ps) * data_s$pre1) / data_s$ps) - 
    mean(((1 - data_s$smoking) * data_s$lead + (data_s$smoking - data_s$ps) * data_s$pre0) / (1 - data_s$ps))
  return(dr_f_fo_tp)
}
### 20. Doubly Robust - False FPGS (dr_ff)
boot_dr_ff <- function(data, indices) {
  data_s <- data[indices, ]
  dr_ff <- mean(((data_s$smoking * data_s$lead) - (data_s$smoking - data_s$psf1) * data_s$pre1) / data_s$psf1) - 
    mean(((1 - data_s$smoking) * data_s$lead + (data_s$smoking - data_s$psf1) * data_s$pre0) / (1 - data_s$psf1))
  return(dr_ff)
}

###non-linear OR model

### 21. Doubly Robust:FPGS - True FPGS (dr_ft)
boot_dr_ft_n <- function(data, indices) {
  data_s <- data[indices, ]
  dr_ft_n <- mean(((data_s$smoking * data_s$lead) - (data_s$smoking - data_s$ps) * data_s$pred1_rf) / data_s$ps) - 
    mean(((1 - data_s$smoking) * data_s$lead + (data_s$smoking - data_s$ps) * data_s$pred0_rf) / (1 - data_s$ps))
  return(dr_ft_n)
}

### 22. Doubly Robust:FPGS - True OR, False PS (dr_f_to_fp)
boot_dr_f_to_fp_n <- function(data, indices) {
  data_s <- data[indices, ]
  dr_f_to_fp_n <- mean(((data_s$smoking * data_s$lead) - (data_s$smoking - data_s$psf1) * data_s$pred1_rf) / data_s$psf1) - 
    mean(((1 - data_s$smoking) * data_s$lead + (data_s$smoking - data_s$psf1) * data_s$pred0_rf) / (1 - data_s$psf1))
  return(dr_f_to_fp_n)
}

### 23. Doubly Robust:PGS - False OR, True PS (dr_f_fo_tp)
boot_dr_f_fo_tp_n <- function(data, indices) {
  data_s <- data[indices, ]
  dr_f_fo_tp_n <- mean(((data_s$smoking * data_s$lead) - (data_s$smoking - data_s$ps) * data_s$pre1f_rf) / data_s$ps) - 
    mean(((1 - data_s$smoking) * data_s$lead + (data_s$smoking - data_s$ps) * data_s$pre0f_rf) / (1 - data_s$ps))
  return(dr_f_fo_tp_n)
}
### 24. Doubly Robust - False FPGS (dr_ff)
boot_dr_ff_n <- function(data, indices) {
  data_s <- data[indices, ]
  dr_ff_n <- mean(((data_s$smoking * data_s$lead) - (data_s$smoking - data_s$psf1) * data_s$pre1f_rf) / data_s$psf1) - 
    mean(((1 - data_s$smoking) * data_s$lead + (data_s$smoking - data_s$psf1) * data_s$pre0f_rf) / (1 - data_s$psf1))
  return(dr_ff_n)
}

### Perform Bootstrap for Each Estimator
# Apply bootstrapping to calculate standard errors and confidence intervals for all 12 estimators.

# 1. True-linear PGS (ri_pgt)
res_ri_pgt <- boot(data = Dat_t, statistic = boot_ri_pgt, R = num_bootstrap_samples)
ri_pgt_se <- sd(res_ri_pgt$t)
conf_int_ri_pgt <- boot.ci(res_ri_pgt, type = "perc")

# 2. False-linear PGS (ri_pgf)
res_ri_pgf <- boot(data = Dat_t, statistic = boot_ri_pgf, R = num_bootstrap_samples)
ri_pgf_se <- sd(res_ri_pgf$t)
conf_int_ri_pgf <- boot.ci(res_ri_pgf, type = "perc")

# 3. True-non-linear PGS (rf_pgt)
res_rf_pgt <- boot(data = Dat_t, statistic = boot_rf_pgt, R = num_bootstrap_samples)
rf_pgt_se <- sd(res_rf_pgt$t)
conf_int_rf_pgt <- boot.ci(res_rf_pgt, type = "perc")

# 4. False-non-linear PGS (rf_pgf)
res_rf_pgf <- boot(data = Dat_t, statistic = boot_rf_pgf, R = num_bootstrap_samples)
rf_pgf_se <- sd(res_rf_pgf$t)
conf_int_rf_pgf <- boot.ci(res_rf_pgf, type = "perc")

# 5. True-linear FPGS (ri_fpgt)
res_ri_fpgt <- boot(data = Dat_t, statistic = boot_ri_fpgt, R = num_bootstrap_samples)
ri_fpgt_se <- sd(res_ri_fpgt$t)
conf_int_ri_fpgt <- boot.ci(res_ri_fpgt, type = "perc")

# 6. False-linear FPGS (ri_fpgf)
res_ri_fpgf <- boot(data = Dat_t, statistic = boot_ri_fpgf, R = num_bootstrap_samples)
ri_fpgf_se <- sd(res_ri_fpgf$t)
conf_int_ri_fpgf <- boot.ci(res_ri_fpgf, type = "perc")

# 7. True-non-linear FPGS (rf_fpgt)
res_rf_fpgt <- boot(data = Dat_t, statistic = boot_rf_fpgt, R = num_bootstrap_samples)
rf_fpgt_se <- sd(res_rf_fpgt$t)
conf_int_rf_fpgt <- boot.ci(res_rf_fpgt, type = "perc")

# 8. False-non-linear FPGS (rf_fpgf)
res_rf_fpgf <- boot(data = Dat_t, statistic = boot_rf_fpgf, R = num_bootstrap_samples)
rf_fpgf_se <- sd(res_rf_fpgf$t)
conf_int_rf_fpgf <- boot.ci(res_rf_fpgf, type = "perc")

# 9. Doubly Robust - False PGS (dr_pt)
res_dr_pt <- boot(data = Dat_t, statistic = boot_dr_pt, R = num_bootstrap_samples)
dr_pt_se <- sd(res_dr_pt$t)
conf_int_dr_pt <- boot.ci(res_dr_pt, type = "perc")

# 10. Doubly Robust - True PGS (dr_p_to_fp)
res_dr_p_to_fp <- boot(data = Dat_t, statistic = boot_dr_p_to_fp, R = num_bootstrap_samples)
dr_p_to_fp_se <- sd(res_dr_p_to_fp$t)
conf_int_dr_p_to_fp <- boot.ci(res_dr_p_to_fp, type = "perc")

# 11. Doubly Robust - True PGS (dr_p_fo_tp)
res_dr_p_fo_tp <- boot(data = Dat_t, statistic = boot_dr_p_fo_tp, R = num_bootstrap_samples)
dr_p_fo_tp_se <- sd(res_dr_p_fo_tp$t)
conf_int_dr_p_fo_tp <- boot.ci(res_dr_p_fo_tp, type = "perc")

# 12. Doubly Robust - False PGS (dr_pf)
res_dr_pf <- boot(data = Dat_t, statistic = boot_dr_pf, R = num_bootstrap_samples)
dr_pf_se <- sd(res_dr_pf$t)
conf_int_dr_pf <- boot.ci(res_dr_pf, type = "perc")

# 13. Doubly Robust - False PGS (dr_pt_n)
res_dr_pt_n <- boot(data = Dat_t, statistic = boot_dr_pt_n, R = num_bootstrap_samples)
dr_pt_n_se <- sd(res_dr_pt_n$t)
conf_int_dr_pt_n <- boot.ci(res_dr_pt_n, type = "perc")

# 14. Doubly Robust - True PGS (dr_p_to_fp_n)
res_dr_p_to_fp_n <- boot(data = Dat_t, statistic = boot_dr_p_to_fp_n, R = num_bootstrap_samples)
dr_p_to_fp_n_se <- sd(res_dr_p_to_fp_n$t)
conf_int_dr_p_to_fp_n <- boot.ci(res_dr_p_to_fp_n, type = "perc")

# 15. Doubly Robust - True PGS (dr_p_fo_tp_n)
res_dr_p_fo_tp_n <- boot(data = Dat_t, statistic = boot_dr_p_fo_tp_n, R = num_bootstrap_samples)
dr_p_fo_tp_n_se <- sd(res_dr_p_fo_tp_n$t)
conf_int_dr_p_fo_tp_n <- boot.ci(res_dr_p_fo_tp_n, type = "perc")

# 16. Doubly Robust - False PGS (dr_pf_n)
res_dr_pf_n <- boot(data = Dat_t, statistic = boot_dr_pf_n, R = num_bootstrap_samples)
dr_pf_n_se <- sd(res_dr_pf_n$t)
conf_int_dr_pf_n <- boot.ci(res_dr_pf_n, type = "perc")

# 17. Doubly Robust - True FPGS (dr_ft)
res_dr_ft <- boot(data = Dat_t, statistic = boot_dr_ft, R = num_bootstrap_samples)
dr_ft_se <- sd(res_dr_ft$t)
conf_int_dr_ft <- boot.ci(res_dr_ft, type = "perc")

# 18. Doubly Robust - True FPGS (dr_f_to_fp)
res_dr_f_to_fp <- boot(data = Dat_t, statistic = boot_dr_f_to_fp, R = num_bootstrap_samples)
dr_f_to_fp_se <- sd(res_dr_f_to_fp$t)
conf_int_dr_f_to_fp <- boot.ci(res_dr_f_to_fp, type = "perc")

# 19. Doubly Robust - True FPGS (dr_f_fo_tp)
res_dr_f_fo_tp <- boot(data = Dat_t, statistic = boot_dr_f_fo_tp, R = num_bootstrap_samples)
dr_f_fo_tp_se <- sd(res_dr_f_fo_tp$t)
conf_int_dr_f_fo_tp <- boot.ci(res_dr_f_fo_tp, type = "perc")

# 20. Doubly Robust - False FPGS (dr_ff)
res_dr_ff <- boot(data = Dat_t, statistic = boot_dr_ff, R = num_bootstrap_samples)
dr_ff_se <- sd(res_dr_ff$t)
conf_int_dr_ff <- boot.ci(res_dr_ff, type = "perc")

# 21. Doubly Robust - True FPGS (dr_ft_n)
res_dr_ft_n <- boot(data = Dat_t, statistic = boot_dr_ft_n, R = num_bootstrap_samples)
dr_ft_n_se <- sd(res_dr_ft_n$t)
conf_int_dr_ft_n <- boot.ci(res_dr_ft_n, type = "perc")

# 22. Doubly Robust - True FPGS (dr_f_to_fp_n)
res_dr_f_to_fp_n <- boot(data = Dat_t, statistic = boot_dr_f_to_fp_n, R = num_bootstrap_samples)
dr_f_to_fp_n_se <- sd(res_dr_f_to_fp_n$t )
conf_int_dr_f_to_fp_n <- boot.ci(res_dr_f_to_fp_n, type = "perc")

# 23. Doubly Robust - True FPGS (dr_f_fo_tp_n)
res_dr_f_fo_tp_n <- boot(data = Dat_t, statistic = boot_dr_f_fo_tp_n, R = num_bootstrap_samples)
dr_f_fo_tp_n_se <- sd(res_dr_f_fo_tp_n$t, na.rm = TRUE)
conf_int_dr_f_fo_tp_n <- boot.ci(res_dr_f_fo_tp_n, type = "perc",,na.rm = TRUE)

# 24. Doubly Robust - False FPGS (dr_ff)
res_dr_ff_n <- boot(data = Dat_t, statistic = boot_dr_ff_n, R = num_bootstrap_samples)
dr_ff_n_se <- sd(res_dr_ff_n$t)
conf_int_dr_ff_n <- boot.ci(res_dr_ff_n, type = "perc")

### Print Results for Standard Error and 95% Confidence Intervals

# 1. True-linear PGS (ri_pgt)
print(paste("Bootstrap SE for ri_pgt:", ri_pgt_se))
print(paste("95% CI for ri_pgt:", conf_int_ri_pgt$percent[4], "-", conf_int_ri_pgt$percent[5]))

# 2. False-linear PGS (ri_pgf)
print(paste("Bootstrap SE for ri_pgf:", ri_pgf_se))
print(paste("95% CI for ri_pgf:", conf_int_ri_pgf$percent[4], "-", conf_int_ri_pgf$percent[5]))

# 3. True-non-linear PGS (rf_pgt)
print(paste("Bootstrap SE for rf_pgt:", rf_pgt_se))
print(paste("95% CI for rf_pgt:", conf_int_rf_pgt$percent[4], "-", conf_int_rf_pgt$percent[5]))

# 4. False-non-linear PGS (rf_pgf)
print(paste("Bootstrap SE for rf_pgf:", rf_pgf_se))
print(paste("95% CI for rf_pgf:", conf_int_rf_pgf$percent[4], "-", conf_int_rf_pgf$percent[5]))

# 5. True-linear FPGS (ri_fpgt)
print(paste("Bootstrap SE for ri_fpgt:", ri_fpgt_se))
print(paste("95% CI for ri_fpgt:", conf_int_ri_fpgt$percent[4], "-", conf_int_ri_fpgt$percent[5]))

# 6. False-linear FPGS (ri_fpgf)
print(paste("Bootstrap SE for ri_fpgf:", ri_fpgf_se))
print(paste("95% CI for ri_fpgf:", conf_int_ri_fpgf$percent[4], "-", conf_int_ri_fpgf$percent[5]))

# 7. True-non-linear FPGS (rf_fpgt)
print(paste("Bootstrap SE for rf_fpgt:", rf_fpgt_se))
print(paste("95% CI for rf_fpgt:", conf_int_rf_fpgt$percent[4], "-", conf_int_rf_fpgt$percent[5]))

# 8. False-non-linear FPGS (rf_fpgf)
print(paste("Bootstrap SE for rf_fpgf:", rf_fpgf_se))
print(paste("95% CI for rf_fpgf:", conf_int_rf_fpgf$percent[4], "-", conf_int_rf_fpgf$percent[5]))

# 9. Doubly Robust - True PGS (dr_pt)
print(paste("Bootstrap SE for dr_pt:", dr_pt_se))
print(paste("95% CI for dr_pt:", conf_int_dr_pt$percent[4], "-", conf_int_dr_pt$percent[5]))

# 10. Doubly Robust - True PGS (dr_p_to_fp)
print(paste("Bootstrap SE for dr_p_to_fp:", dr_p_to_fp_se))
print(paste("95% CI for dr_p_to_fp:", conf_int_dr_p_to_fp$percent[4], "-", conf_int_dr_p_to_fp$percent[5]))

# 11. Doubly Robust - True PGS (dr_p_fo_tp)
print(paste("Bootstrap SE for dr_p_fo_tp:", dr_p_fo_tp_se))
print(paste("95% CI for dr_p_fo_tp:", conf_int_dr_p_fo_tp$percent[4], "-", conf_int_dr_p_fo_tp$percent[5]))

# 12. Doubly Robust - False PGS (dr_pf)
print(paste("Bootstrap SE for dr_pf:", dr_pf_se))
print(paste("95% CI for dr_pf:", conf_int_dr_pf$percent[4], "-", conf_int_dr_pf$percent[5]))

# 13. Doubly Robust - True PGS (dr_pt_n)
print(paste("Bootstrap SE for dr_pt_n:", dr_pt_n_se))
print(paste("95% CI for dr_pt:", conf_int_dr_pt_n$percent[4], "-", conf_int_dr_pt_n$percent[5]))

# 14. Doubly Robust - True PGS (dr_p_to_fp_n)
print(paste("Bootstrap SE for dr_p_to_fp_n:", dr_p_to_fp_n_se))
print(paste("95% CI for dr_p_to_fp_n:", conf_int_dr_p_to_fp_n$percent[4], "-", conf_int_dr_p_to_fp_n$percent[5]))

# 15. Doubly Robust - True PGS (dr_p_fo_tp_n)
print(paste("Bootstrap SE for dr_p_fo_tp_n:", dr_p_fo_tp_n_se))
print(paste("95% CI for dr_p_fo_tp_n:", conf_int_dr_p_fo_tp_n$percent[4], "-", conf_int_dr_p_fo_tp_n$percent[5]))

# 16. Doubly Robust - False PGS (dr_pf_n)
print(paste("Bootstrap SE for dr_pf_n:", dr_pf_n_se))
print(paste("95% CI for dr_pf_n:", conf_int_dr_pf_n$percent[4], "-", conf_int_dr_pf_n$percent[5]))

# 17. Doubly Robust - True FPGS (dr_ft)
print(paste("Bootstrap SE for dr_ft:", dr_ft_se))
print(paste("95% CI for dr_ft:", conf_int_dr_ft$percent[4], "-", conf_int_dr_ft$percent[5]))

# 18. Doubly Robust - True PGS (dr_f_to_fp)
print(paste("Bootstrap SE for dr_f_to_fp:", dr_f_to_fp_se))
print(paste("95% CI for dr_f_to_fp:", conf_int_dr_f_to_fp$percent[4], "-", conf_int_dr_f_to_fp$percent[5]))

# 19. Doubly Robust - True PGS (dr_f_fo_tp)
print(paste("Bootstrap SE for dr_p_fo_tp:", dr_p_fo_tp_se))
print(paste("95% CI for dr_p_fo_tp:", conf_int_dr_f_fo_tp$percent[4], "-", conf_int_dr_f_fo_tp$percent[5]))

# 20. Doubly Robust - False FPGS (dr_ff)
print(paste("Bootstrap SE for dr_ff:", dr_ff_se))
print(paste("95% CI for dr_ff:", conf_int_dr_ff$percent[4], "-", conf_int_dr_ff$percent[5]))

# 21. Doubly Robust - True FPGS (dr_ft_n)
print(paste("Bootstrap SE for dr_ft_n:", dr_ft_n_se))
print(paste("95% CI for dr_ft_n:", conf_int_dr_ft_n$percent[4], "-", conf_int_dr_ft_n$percent[5]))

# 22. Doubly Robust - True PGS (dr_f_to_fp_n)
print(paste("Bootstrap SE for dr_f_to_fp_n:", dr_f_to_fp_n_se))
print(paste("95% CI for dr_f_to_fp_n:", conf_int_dr_f_to_fp_n$percent[4], "-", conf_int_dr_f_to_fp_n$percent[5]))

# 23. Doubly Robust - True PGS (dr_f_fo_tp_n)
print(paste("Bootstrap SE for dr_p_fo_tp_n:", dr_p_fo_tp_n_se))
print(paste("95% CI for dr_p_fo_tp_n:", conf_int_dr_f_fo_tp_n$percent[4], "-", conf_int_dr_f_fo_tp_n$percent[5]))

# 24. Doubly Robust - False FPGS (dr_ff_n)
print(paste("Bootstrap SE for dr_ff_n:", dr_ff_n_se))
print(paste("95% CI for dr_ff_n:", conf_int_dr_ff_n$percent[4], "-", conf_int_dr_ff_n$percent[5]))

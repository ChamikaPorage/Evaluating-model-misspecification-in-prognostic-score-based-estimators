############################
# Run file for Simulation 2#
############################

##########
#DESIGN A#
##########

source(".../Simulation 2/Sim2_DesA_cf.R")
source(".../Simulation 2/Estimators_cf.R")
source(".../Simulation 2/matching_estimators.R")

N <- 3000
seed <- 2025
datat <- gen.data.A2(N,  seed)

estim.A3_s2 <- estimators(datat)

ri_pgt.A3_s2 <- estim.A3_s2[, 1]
ri_pgf.A3_s2 <- estim.A3_s2[, 2]
rf_pgt.A3_s2 <- estim.A3_s2[, 3]
rf_pgf.A3_s2 <- estim.A3_s2[, 4]
ri_fpgt.A3_s2 <- estim.A3_s2[, 5]
ri_fpgf.A3_s2 <- estim.A3_s2[, 6]
rf_fpgt.A3_s2 <- estim.A3_s2[, 7]
rf_fpgf.A3_s2 <- estim.A3_s2[, 8]

match.A3_s2 <- matching_estimators(datat)

mat_lin_pgs_t.A3_s2 <- match.A3_s2[, 1]
mat_lin_pgs_f.A3_s2 <- match.A3_s2[, 2]
mat_nn_pgs_t.A3_s2 <- match.A3_s2[, 3]
mat_nn_pgs_f.A3_s2 <- match.A3_s2[, 4]
mat_lin_fpgs_t.A3_s2 <- match.A3_s2[, 5]
mat_lin_fpgs_f.A3_s2 <- match.A3_s2[, 6]
mat_nn_fpgs_t.A3_s2 <- match.A3_s2[, 7]
mat_nn_fpgs_f.A3_s2 <- match.A3_s2[, 8]

##########
#DESIGN B#
##########
source(".../Simulation 2/Sim2_DesB_cf.R")

N <- 3000
seed <- 2025
datat <- gen.data.B2(N,  seed)

estim.B3_s2 <- estimators(datat)

ri_pgt.B3_s2 <- estim.B3_s2[, 1]
ri_pgf.B3_s2 <- estim.B3_s2[, 2]
rf_pgt.B3_s2 <- estim.B3_s2[, 3]
rf_pgf.B3_s2 <- estim.B3_s2[, 4]
ri_fpgt.B3_s2 <- estim.B3_s2[, 5]
ri_fpgf.B3_s2 <- estim.B3_s2[, 6]
rf_fpgt.B3_s2 <- estim.B3_s2[, 7]
rf_fpgf.B3_s2 <- estim.B3_s2[, 8]

match.B3_s2 <- matching_estimators(datat)

mat_lin_pgs_t.B3_s2 <- match.B3_s2[, 1]
mat_lin_pgs_f.B3_s2 <- match.B3_s2[, 2]
mat_nn_pgs_t.B3_s2 <- match.B3_s2[, 3]
mat_nn_pgs_f.B3_s2 <- match.B3_s2[, 4]
mat_lin_fpgs_t.B3_s2 <- match.B3_s2[, 5]
mat_lin_fpgs_f.B3_s2 <- match.B3_s2[, 6]
mat_nn_fpgs_t.B3_s2 <- match.B3_s2[, 7]
mat_nn_fpgs_f.B3_s2 <- match.B3_s2[, 8]

###########
# Design C#
###########
source(".../Simulation 2/Sim2_DesC_cf.R")

N <- 3000
seed <- 2025
datat <- gen.data.C2(N,  seed)

estim.C3_s2 <- estimators(datat)

ri_pgt.C3_s2 <- estim.C3_s2[, 1]
ri_pgf.C3_s2 <- estim.C3_s2[, 2]
rf_pgt.C3_s2 <- estim.C3_s2[, 3]
rf_pgf.C3_s2 <- estim.C3_s2[, 4]
ri_fpgt.C3_s2 <- estim.C3_s2[, 5]
ri_fpgf.C3_s2 <- estim.C3_s2[, 6]
rf_fpgt.C3_s2 <- estim.C3_s2[, 7]
rf_fpgf.C3_s2 <- estim.C3_s2[, 8]

match.C3_s2 <- matching_estimators(datat)

mat_lin_pgs_t.C3_s2 <- match.C3_s2[, 1]
mat_lin_pgs_f.C3_s2 <- match.C3_s2[, 2]
mat_nn_pgs_t.C3_s2 <- match.C3_s2[, 3]
mat_nn_pgs_f.C3_s2 <- match.C3_s2[, 4]
mat_lin_fpgs_t.C3_s2 <- match.C3_s2[, 5]
mat_lin_fpgs_f.C3_s2 <- match.C3_s2[, 6]
mat_nn_fpgs_t.C3_s2 <- match.C3_s2[, 7]
mat_nn_fpgs_f.C3_s2 <- match.C3_s2[, 8]

# Prepare the results for latex table

True.A3_s2 <- round(cbind(
  mean(ri_pgt.A3_s2) - 3.7, sd(ri_pgt.A3_s2), mean((ri_pgt.A3_s2 - 3.7)^2), 
  mean(rf_pgt.A3_s2) - 3.7, sd(rf_pgt.A3_s2), mean((rf_pgt.A3_s2 - 3.7)^2), 
  mean(ri_fpgt.A3_s2) - 3.7, sd(ri_fpgt.A3_s2), mean((ri_fpgt.A3_s2 - 3.7)^2), 
  mean(rf_fpgt.A3_s2) - 3.7, sd(rf_fpgt.A3_s2), mean((rf_fpgt.A3_s2 - 3.7)^2)), 
   digits = 3
)

False.A3_s2 <- round(cbind(
  mean(ri_pgf.A3_s2) - 3.7, sd(ri_pgf.A3_s2), mean((ri_pgf.A3_s2 - 3.7)^2), 
  mean(rf_pgf.A3_s2) - 3.7, sd(rf_pgf.A3_s2), mean((rf_pgf.A3_s2 - 3.7)^2), 
  mean(ri_fpgf.A3_s2) - 3.7, sd(ri_fpgf.A3_s2), mean((ri_fpgf.A3_s2 - 3.7)^2), 
  mean(rf_fpgf.A3_s2) - 3.7, sd(rf_fpgf.A3_s2), mean((rf_fpgf.A3_s2 - 3.7)^2)), 
  digits = 3
)

True.B3_s2 <- round(cbind(
  mean(ri_pgt.B3_s2) - 3.7, sd(ri_pgt.B3_s2), mean((ri_pgt.B3_s2 - 3.7)^2), 
  mean(rf_pgt.B3_s2) - 3.7, sd(rf_pgt.B3_s2), mean((rf_pgt.B3_s2 - 3.7)^2), 
  mean(ri_fpgt.B3_s2) - 3.7, sd(ri_fpgt.B3_s2), mean((ri_fpgt.B3_s2 - 3.7)^2), 
  mean(rf_fpgt.B3_s2) - 3.7, sd(rf_fpgt.B3_s2), mean((rf_fpgt.B3_s2 - 3.7)^2)), 
  digits = 3
)

False.B3_s2 <- round(cbind(
  mean(ri_pgf.B3_s2) - 3.7, sd(ri_pgf.B3_s2), mean((ri_pgf.B3_s2 - 3.7)^2), 
  mean(rf_pgf.B3_s2) - 3.7, sd(rf_pgf.B3_s2), mean((rf_pgf.B3_s2 - 3.7)^2), 
  mean(ri_fpgf.B3_s2) - 3.7, sd(ri_fpgf.B3_s2), mean((ri_fpgf.B3_s2 - 3.7)^2), 
  mean(rf_fpgf.B3_s2) - 3.7, sd(rf_fpgf.B3_s2), mean((rf_fpgf.B3_s2 - 3.7)^2)), 
  digits = 3
)

True.C3_s2 <- round(cbind(
  mean(ri_pgt.C3_s2) - 3.7, sd(ri_pgt.C3_s2), mean((ri_pgt.C3_s2 - 3.7)^2), 
  mean(rf_pgt.C3_s2) - 3.7, sd(rf_pgt.C3_s2), mean((rf_pgt.C3_s2 - 3.7)^2), 
  mean(ri_fpgt.C3_s2) - 3.7, sd(ri_fpgt.C3_s2), mean((ri_fpgt.C3_s2 - 3.7)^2), 
  mean(rf_fpgt.C3_s2) - 3.7, sd(rf_fpgt.C3_s2), mean((rf_fpgt.C3_s2 - 3.7)^2)), 
   digits = 3
)

False.C3_s2 <- round(cbind(
  mean(ri_pgf.C3_s2) - 3.7, sd(ri_pgf.C3_s2), mean((ri_pgf.C3_s2 - 3.7)^2), 
  mean(rf_pgf.C3_s2) - 3.7, sd(rf_pgf.C3_s2), mean((rf_pgf.C3_s2 - 3.7)^2), 
  mean(ri_fpgf.C3_s2) - 3.7, sd(ri_fpgf.C3_s2), mean((ri_fpgf.C3_s2 - 3.7)^2), 
  mean(rf_fpgf.C3_s2) - 3.7, sd(rf_fpgf.C3_s2), mean((rf_fpgf.C3_s2 - 3.7)^2)), 
  digits = 3
)


MAT.A3_s2 <- round(cbind(
  mean(mat_lin_pgs_t.A3_s2) - 3.7, sd(mat_lin_pgs_t.A3_s2), mean((mat_lin_pgs_t.A3_s2 - 3.7)^2),
  mean(mat_lin_pgs_f.A3_s2) - 3.7, sd(mat_lin_pgs_f.A3_s2), mean((mat_lin_pgs_f.A3_s2 - 3.7)^2), 
  mean(mat_nn_pgs_t.A3_s2) - 3.7, sd(mat_nn_pgs_t.A3_s2), mean((mat_nn_pgs_t.A3_s2 - 3.7)^2),
  mean(mat_nn_pgs_f.A3_s2) - 3.7, sd(mat_nn_pgs_f.A3_s2), mean((mat_nn_pgs_f.A3_s2 - 3.7)^2),
  mean(mat_lin_fpgs_t.A3_s2) - 3.7, sd(mat_lin_fpgs_t.A3_s2), mean((mat_lin_fpgs_t.A3_s2 - 3.7)^2),
  mean(mat_lin_fpgs_f.A3_s2) - 3.7, sd(mat_lin_fpgs_f.A3_s2), mean((mat_lin_fpgs_f.A3_s2 - 3.7)^2), 
  mean(mat_nn_fpgs_t.A3_s2) - 3.7, sd(mat_nn_fpgs_t.A3_s2), mean((mat_nn_fpgs_t.A3_s2 - 3.7)^2),
  mean(mat_nn_fpgs_f.A3_s2) - 3.7, sd(mat_nn_fpgs_f.A3_s2), mean((mat_nn_fpgs_f.A3_s2 - 3.7)^2)),
  digits = 3
)

MAT.B3_s2 <- round(cbind(
  mean(mat_lin_pgs_t.B3_s2) - 3.7, sd(mat_lin_pgs_t.B3_s2), mean((mat_lin_pgs_t.B3_s2 - 3.7)^2),
  mean(mat_lin_pgs_f.B3_s2) - 3.7, sd(mat_lin_pgs_f.B3_s2), mean((mat_lin_pgs_f.B3_s2 - 3.7)^2), 
  mean(mat_nn_pgs_t.B3_s2) - 3.7, sd(mat_nn_pgs_t.B3_s2), mean((mat_nn_pgs_t.B3_s2 - 3.7)^2),
  mean(mat_nn_pgs_f.B3_s2) - 3.7, sd(mat_nn_pgs_f.B3_s2), mean((mat_nn_pgs_f.B3_s2 - 3.7)^2),
  mean(mat_lin_fpgs_t.B3_s2) - 3.7, sd(mat_lin_fpgs_t.B3_s2), mean((mat_lin_fpgs_t.B3_s2 - 3.7)^2),
  mean(mat_lin_fpgs_f.B3_s2) - 3.7, sd(mat_lin_fpgs_f.B3_s2), mean((mat_lin_fpgs_f.B3_s2 - 3.7)^2), 
  mean(mat_nn_fpgs_t.B3_s2) - 3.7, sd(mat_nn_fpgs_t.B3_s2), mean((mat_nn_fpgs_t.B3_s2 - 3.7)^2),
  mean(mat_nn_fpgs_f.B3_s2) - 3.7, sd(mat_nn_fpgs_f.B3_s2), mean((mat_nn_fpgs_f.B3_s2 - 3.7)^2)),
  digits = 3
)

MAT.C3_s2 <- round(cbind(
  mean(mat_lin_pgs_t.C3_s2) - 3.7, sd(mat_lin_pgs_t.C3_s2), mean((mat_lin_pgs_t.C3_s2 - 3.7)^2),
  mean(mat_lin_pgs_f.C3_s2) - 3.7, sd(mat_lin_pgs_f.C3_s2), mean((mat_lin_pgs_f.C3_s2 - 3.7)^2), 
  mean(mat_nn_pgs_t.C3_s2) - 3.7, sd(mat_nn_pgs_t.C3_s2), mean((mat_nn_pgs_t.C3_s2 - 3.7)^2),
  mean(mat_nn_pgs_f.C3_s2) - 3.7, sd(mat_nn_pgs_f.C3_s2), mean((mat_nn_pgs_f.C3_s2 - 3.7)^2),
  mean(mat_lin_fpgs_t.C3_s2) - 3.7, sd(mat_lin_fpgs_t.C3_s2), mean((mat_lin_fpgs_t.C3_s2 - 3.7)^2),
  mean(mat_lin_fpgs_f.C3_s2) - 3.7, sd(mat_lin_fpgs_f.C3_s2), mean((mat_lin_fpgs_f.C3_s2 - 3.7)^2), 
  mean(mat_nn_fpgs_t.C3_s2) - 3.7, sd(mat_nn_fpgs_t.C3_s2), mean((mat_nn_fpgs_t.C3_s2 - 3.7)^2),
  mean(mat_nn_fpgs_f.C3_s2) - 3.7, sd(mat_nn_fpgs_f.C3_s2), mean((mat_nn_fpgs_f.C3_s2 - 3.7)^2)),
  digits = 3
)



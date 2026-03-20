############################
# Run file for Simulation 2#
############################

##########
#DESIGN A#
##########

source(".../Simulation 2/Sim2_DesA_cf.R")
source(".../Simulation 2/Estimators_cf.R")
source(".../Simulation 2/matching_estimators.R")

N <- 1000
seed <- 2025
datat <- gen.data.A2(N,  seed)

estim.A2_s2 <- estimators(datat)

ri_pgt.A2_s2 <- estim.A2_s2[, 1]
ri_pgf.A2_s2 <- estim.A2_s2[, 2]
rf_pgt.A2_s2 <- estim.A2_s2[, 3]
rf_pgf.A2_s2 <- estim.A2_s2[, 4]
ri_fpgt.A2_s2 <- estim.A2_s2[, 5]
ri_fpgf.A2_s2 <- estim.A2_s2[, 6]
rf_fpgt.A2_s2 <- estim.A2_s2[, 7]
rf_fpgf.A2_s2 <- estim.A2_s2[, 8]

match.A2_s2 <- matching_estimators(datat)

mat_lin_pgs_t.A2_s2 <- match.A2_s2[, 1]
mat_lin_pgs_f.A2_s2 <- match.A2_s2[, 2]
mat_nn_pgs_t.A2_s2 <- match.A2_s2[, 3]
mat_nn_pgs_f.A2_s2 <- match.A2_s2[, 4]
mat_lin_fpgs_t.A2_s2 <- match.A2_s2[, 5]
mat_lin_fpgs_f.A2_s2 <- match.A2_s2[, 6]
mat_nn_fpgs_t.A2_s2 <- match.A2_s2[, 7]
mat_nn_fpgs_f.A2_s2 <- match.A2_s2[, 8]


##########
#DESIGN B#
##########
source(".../Simulation 2/Sim2_DesB_cf.R")

N <- 1000
seed <- 2025
datat <- gen.data.B2(N,  seed)

estim.B2_s2 <- estimators(datat)

ri_pgt.B2_s2 <- estim.B2_s2[, 1]
ri_pgf.B2_s2 <- estim.B2_s2[, 2]
rf_pgt.B2_s2 <- estim.B2_s2[, 3]
rf_pgf.B2_s2 <- estim.B2_s2[, 4]
ri_fpgt.B2_s2 <- estim.B2_s2[, 5]
ri_fpgf.B2_s2 <- estim.B2_s2[, 6]
rf_fpgt.B2_s2 <- estim.B2_s2[, 7]
rf_fpgf.B2_s2 <- estim.B2_s2[, 8]

match.B2_s2 <- matching_estimators(datat)

mat_lin_pgs_t.B2_s2 <- match.B2_s2[, 1]
mat_lin_pgs_f.B2_s2 <- match.B2_s2[, 2]
mat_nn_pgs_t.B2_s2 <- match.B2_s2[, 3]
mat_nn_pgs_f.B2_s2 <- match.B2_s2[, 4]
mat_lin_fpgs_t.B2_s2 <- match.B2_s2[, 5]
mat_lin_fpgs_f.B2_s2 <- match.B2_s2[, 6]
mat_nn_fpgs_t.B2_s2 <- match.B2_s2[, 7]
mat_nn_fpgs_f.B2_s2 <- match.B2_s2[, 8]


###########
# Design C#
###########
source(".../Simulation 2/Sim2_DesC_cf.R")

N <- 1000
seed <- 2025
datat <- gen.data.C2(N,  seed)

estim.C2_s2 <- estimators(datat)

ri_pgt.C2_s2 <- estim.C2_s2[, 1]
ri_pgf.C2_s2 <- estim.C2_s2[, 2]
rf_pgt.C2_s2 <- estim.C2_s2[, 3]
rf_pgf.C2_s2 <- estim.C2_s2[, 4]
ri_fpgt.C2_s2 <- estim.C2_s2[, 5]
ri_fpgf.C2_s2 <- estim.C2_s2[, 6]
rf_fpgt.C2_s2 <- estim.C2_s2[, 7]
rf_fpgf.C2_s2 <- estim.C2_s2[, 8]

match.C2_s2 <- matching_estimators(datat)

mat_lin_pgs_t.C2_s2 <- match.C2_s2[, 1]
mat_lin_pgs_f.C2_s2 <- match.C2_s2[, 2]
mat_nn_pgs_t.C2_s2 <- match.C2_s2[, 3]
mat_nn_pgs_f.C2_s2 <- match.C2_s2[, 4]
mat_lin_fpgs_t.C2_s2 <- match.C2_s2[, 5]
mat_lin_fpgs_f.C2_s2 <- match.C2_s2[, 6]
mat_nn_fpgs_t.C2_s2 <- match.C2_s2[, 7]
mat_nn_fpgs_f.C2_s2 <- match.C2_s2[, 8]


# Prepare the results for latex table

True.A2_s2 <- round(cbind(
  mean(ri_pgt.A2_s2) - 3.7, sd(ri_pgt.A2_s2), mean((ri_pgt.A2_s2 - 3.7)^2), 
  mean(rf_pgt.A2_s2) - 3.7, sd(rf_pgt.A2_s2), mean((rf_pgt.A2_s2 - 3.7)^2), 
  mean(ri_fpgt.A2_s2) - 3.7, sd(ri_fpgt.A2_s2), mean((ri_fpgt.A2_s2 - 3.7)^2), 
  mean(rf_fpgt.A2_s2) - 3.7, sd(rf_fpgt.A2_s2), mean((rf_fpgt.A2_s2 - 3.7)^2)), 
  digits = 3
)

False.A2_s2 <- round(cbind(
  mean(ri_pgf.A2_s2) - 3.7, sd(ri_pgf.A2_s2), mean((ri_pgf.A2_s2 - 3.7)^2), 
  mean(rf_pgf.A2_s2) - 3.7, sd(rf_pgf.A2_s2), mean((rf_pgf.A2_s2 - 3.7)^2), 
  mean(ri_fpgf.A2_s2) - 3.7, sd(ri_fpgf.A2_s2), mean((ri_fpgf.A2_s2 - 3.7)^2), 
  mean(rf_fpgf.A2_s2) - 3.7, sd(rf_fpgf.A2_s2), mean((rf_fpgf.A2_s2 - 3.7)^2)), 
  digits = 3
)

True.B2_s2 <- round(cbind(
  mean(ri_pgt.B2_s2) - 3.7, sd(ri_pgt.B2_s2), mean((ri_pgt.B2_s2 - 3.7)^2), 
  mean(rf_pgt.B2_s2) - 3.7, sd(rf_pgt.B2_s2), mean((rf_pgt.B2_s2 - 3.7)^2), 
  mean(ri_fpgt.B2_s2) - 3.7, sd(ri_fpgt.B2_s2), mean((ri_fpgt.B2_s2 - 3.7)^2), 
  mean(rf_fpgt.B2_s2) - 3.7, sd(rf_fpgt.B2_s2), mean((rf_fpgt.B2_s2 - 3.7)^2)), 
  digits = 3
)

False.B2_s2 <- round(cbind(
  mean(ri_pgf.B2_s2) - 3.7, sd(ri_pgf.B2_s2), mean((ri_pgf.B2_s2 - 3.7)^2), 
  mean(rf_pgf.B2_s2) - 3.7, sd(rf_pgf.B2_s2), mean((rf_pgf.B2_s2 - 3.7)^2), 
  mean(ri_fpgf.B2_s2) - 3.7, sd(ri_fpgf.B2_s2), mean((ri_fpgf.B2_s2 - 3.7)^2), 
  mean(rf_fpgf.B2_s2) - 3.7, sd(rf_fpgf.B2_s2), mean((rf_fpgf.B2_s2 - 3.7)^2)), 
  digits = 3
)
True.C2_s2 <- round(cbind(
  mean(ri_pgt.C2_s2) - 3.7, sd(ri_pgt.C2_s2), mean((ri_pgt.C2_s2 - 3.7)^2), 
  mean(rf_pgt.C2_s2) - 3.7, sd(rf_pgt.C2_s2), mean((rf_pgt.C2_s2 - 3.7)^2), 
  mean(ri_fpgt.C2_s2) - 3.7, sd(ri_fpgt.C2_s2), mean((ri_fpgt.C2_s2 - 3.7)^2), 
  mean(rf_fpgt.C2_s2) - 3.7, sd(rf_fpgt.C2_s2), mean((rf_fpgt.C2_s2 - 3.7)^2)), 
  digits = 3
)

False.C2_s2 <- round(cbind(
  mean(ri_pgf.C2_s2) - 3.7, sd(ri_pgf.C2_s2), mean((ri_pgf.C2_s2 - 3.7)^2), 
  mean(rf_pgf.C2_s2) - 3.7, sd(rf_pgf.C2_s2), mean((rf_pgf.C2_s2 - 3.7)^2), 
  mean(ri_fpgf.C2_s2) - 3.7, sd(ri_fpgf.C2_s2), mean((ri_fpgf.C2_s2 - 3.7)^2), 
  mean(rf_fpgf.C2_s2) - 3.7, sd(rf_fpgf.C2_s2), mean((rf_fpgf.C2_s2 - 3.7)^2)), 
  digits = 3
)

MAT.A2_s2 <- round(cbind(
  mean(mat_lin_pgs_t.A2_s2) - 3.7, sd(mat_lin_pgs_t.A2_s2), mean((mat_lin_pgs_t.A2_s2 - 3.7)^2),
  mean(mat_lin_pgs_f.A2_s2) - 3.7, sd(mat_lin_pgs_f.A2_s2), mean((mat_lin_pgs_f.A2_s2 - 3.7)^2), 
  mean(mat_nn_pgs_t.A2_s2) - 3.7, sd(mat_nn_pgs_t.A2_s2), mean((mat_nn_pgs_t.A2_s2 - 3.7)^2),
  mean(mat_nn_pgs_f.A2_s2) - 3.7, sd(mat_nn_pgs_f.A2_s2), mean((mat_nn_pgs_f.A2_s2 - 3.7)^2),
  mean(mat_lin_fpgs_t.A2_s2) - 3.7, sd(mat_lin_fpgs_t.A2_s2), mean((mat_lin_fpgs_t.A2_s2 - 3.7)^2),
  mean(mat_lin_fpgs_f.A2_s2) - 3.7, sd(mat_lin_fpgs_f.A2_s2), mean((mat_lin_fpgs_f.A2_s2 - 3.7)^2), 
  mean(mat_nn_fpgs_t.A2_s2) - 3.7, sd(mat_nn_fpgs_t.A2_s2), mean((mat_nn_fpgs_t.A2_s2 - 3.7)^2),
  mean(mat_nn_fpgs_f.A2_s2) - 3.7, sd(mat_nn_fpgs_f.A2_s2), mean((mat_nn_fpgs_f.A2_s2 - 3.7)^2)),
  digits = 3
)

MAT.B2_s2 <- round(cbind(
  mean(mat_lin_pgs_t.B2_s2) - 3.7, sd(mat_lin_pgs_t.B2_s2), mean((mat_lin_pgs_t.B2_s2 - 3.7)^2),
  mean(mat_lin_pgs_f.B2_s2) - 3.7, sd(mat_lin_pgs_f.B2_s2), mean((mat_lin_pgs_f.B2_s2 - 3.7)^2), 
  mean(mat_nn_pgs_t.B2_s2) - 3.7, sd(mat_nn_pgs_t.B2_s2), mean((mat_nn_pgs_t.B2_s2 - 3.7)^2),
  mean(mat_nn_pgs_f.B2_s2) - 3.7, sd(mat_nn_pgs_f.B2_s2), mean((mat_nn_pgs_f.B2_s2 - 3.7)^2),
  mean(mat_lin_fpgs_t.B2_s2) - 3.7, sd(mat_lin_fpgs_t.B2_s2), mean((mat_lin_fpgs_t.B2_s2 - 3.7)^2),
  mean(mat_lin_fpgs_f.B2_s2) - 3.7, sd(mat_lin_fpgs_f.B2_s2), mean((mat_lin_fpgs_f.B2_s2 - 3.7)^2), 
  mean(mat_nn_fpgs_t.B2_s2) - 3.7, sd(mat_nn_fpgs_t.B2_s2), mean((mat_nn_fpgs_t.B2_s2 - 3.7)^2),
  mean(mat_nn_fpgs_f.B2_s2) - 3.7, sd(mat_nn_fpgs_f.B2_s2), mean((mat_nn_fpgs_f.B2_s2 - 3.7)^2)),
  digits = 3
)

MAT.C2_s2 <- round(cbind(
  mean(mat_lin_pgs_t.C2_s2) - 3.7, sd(mat_lin_pgs_t.C2_s2), mean((mat_lin_pgs_t.C2_s2 - 3.7)^2),
  mean(mat_lin_pgs_f.C2_s2) - 3.7, sd(mat_lin_pgs_f.C2_s2), mean((mat_lin_pgs_f.C2_s2 - 3.7)^2), 
  mean(mat_nn_pgs_t.C2_s2) - 3.7, sd(mat_nn_pgs_t.C2_s2), mean((mat_nn_pgs_t.C2_s2 - 3.7)^2),
  mean(mat_nn_pgs_f.C2_s2) - 3.7, sd(mat_nn_pgs_f.C2_s2), mean((mat_nn_pgs_f.C2_s2 - 3.7)^2),
  mean(mat_lin_fpgs_t.C2_s2) - 3.7, sd(mat_lin_fpgs_t.C2_s2), mean((mat_lin_fpgs_t.C2_s2 - 3.7)^2),
  mean(mat_lin_fpgs_f.C2_s2) - 3.7, sd(mat_lin_fpgs_f.C2_s2), mean((mat_lin_fpgs_f.C2_s2 - 3.7)^2), 
  mean(mat_nn_fpgs_t.C2_s2) - 3.7, sd(mat_nn_fpgs_t.C2_s2), mean((mat_nn_fpgs_t.C2_s2 - 3.7)^2),
  mean(mat_nn_fpgs_f.C2_s2) - 3.7, sd(mat_nn_fpgs_f.C2_s2), mean((mat_nn_fpgs_f.C2_s2 - 3.7)^2)),
  digits = 3
)

#saving data
results_A1000_s2_mat <- data.frame(
  mat_lin_pgs_t.A2_s2 = mat_lin_pgs_t.A2_s2,
  mat_lin_pgs_f.A2_s2 = mat_lin_pgs_f.A2_s2,
  mat_nn_pgs_t.A2_s2 = mat_nn_pgs_t.A2_s2,
  mat_nn_pgs_f.A2_s2 = mat_nn_pgs_f.A2_s2,
  mat_lin_fpgs_t.A2_s2 = mat_lin_fpgs_t.A2_s2,
  mat_lin_fpgs_f.A2_s2 = mat_lin_fpgs_f.A2_s2,
  mat_nn_fpgs_t.A2_s2 = mat_nn_fpgs_t.A2_s2,
  mat_nn_fpgs_f.A2_s2 = mat_nn_fpgs_f.A2_s2
)
write.csv(results_A1000_s2_mat, file = ".../Simulation 2/results_A1000_s2_mat.csv", row.names = FALSE)

results_B1000_s2_mat <- data.frame(
  mat_lin_pgs_t.B2_s2 = mat_lin_pgs_t.B2_s2,
  mat_lin_pgs_f.B2_s2 = mat_lin_pgs_f.B2_s2,
  mat_nn_pgs_t.B2_s2 = mat_nn_pgs_t.B2_s2,
  mat_nn_pgs_f.B2_s2 = mat_nn_pgs_f.B2_s2,
  mat_lin_fpgs_t.B2_s2 = mat_lin_fpgs_t.B2_s2,
  mat_lin_fpgs_f.B2_s2 = mat_lin_fpgs_f.B2_s2,
  mat_nn_fpgs_t.B2_s2 = mat_nn_fpgs_t.B2_s2,
  mat_nn_fpgs_f.B2_s2 = mat_nn_fpgs_f.B2_s2
)
write.csv(results_B1000_s2_mat, file = ".../Simulation 2/results_B1000_s2_mat.csv", row.names = FALSE)

results_C1000_s2_mat <- data.frame(
  mat_lin_pgs_t.C2_s2 = mat_lin_pgs_t.C2_s2,
  mat_lin_pgs_f.C2_s2 = mat_lin_pgs_f.C2_s2,
  mat_nn_pgs_t.C2_s2 = mat_nn_pgs_t.C2_s2,
  mat_nn_pgs_f.C2_s2 = mat_nn_pgs_f.C2_s2,
  mat_lin_fpgs_t.C2_s2 = mat_lin_fpgs_t.C2_s2,
  mat_lin_fpgs_f.C2_s2 = mat_lin_fpgs_f.C2_s2,
  mat_nn_fpgs_t.C2_s2 = mat_nn_fpgs_t.C2_s2,
  mat_nn_fpgs_f.C2_s2 = mat_nn_fpgs_f.C2_s2
)
write.csv(results_C1000_s2_mat, file = ".../Simulation 2/results_C1000_s2_mat.csv", row.names = FALSE)

#saving data
results_A1000_s2 <- data.frame(
  ri_pgt.A2_s2 = ri_pgt.A2_s2,
  ri_pgf.A2_s2 = ri_pgf.A2_s2,
  rf_pgt.A2_s2 = rf_pgt.A2_s2,
  rf_pgf.A2_s2 = rf_pgf.A2_s2,
  ri_fpgt.A2_s2 = ri_fpgt.A2_s2,
  ri_fpgf.A2_s2 = ri_fpgf.A2_s2,
  rf_fpgt.A2_s2 = rf_fpgt.A2_s2,
  rf_fpgf.A2_s2 = rf_fpgf.A2_s2
)
write.csv(results_A1000_s2, file = ".../Simulation 2/results_A1000_s2.csv", row.names = FALSE)

results_B1000_s2 <- data.frame(
  ri_pgt.B2_s2 = ri_pgt.B2_s2,
  ri_pgf.B2_s2 = ri_pgf.B2_s2,
  rf_pgt.B2_s2 = rf_pgt.B2_s2,
  rf_pgf.B2_s2 = rf_pgf.B2_s2,
  ri_fpgt.B2_s2 = ri_fpgt.B2_s2,
  ri_fpgf.B2_s2 = ri_fpgf.B2_s2,
  rf_fpgt.B2_s2 = rf_fpgt.B2_s2,
  rf_fpgf.B2_s2 = rf_fpgf.B2_s2
)
write.csv(results_B1000_s2, file = ".../Simulation 2/results_B1000_s2.csv", row.names = FALSE)

results_C1000_s2 <- data.frame(
  ri_pgt.C2_s2 = ri_pgt.C2_s2,
  ri_pgf.C2_s2 = ri_pgf.C2_s2,
  rf_pgt.C2_s2 = rf_pgt.C2_s2,
  rf_pgf.C2_s2 = rf_pgf.C2_s2,
  ri_fpgt.C2_s2 = ri_fpgt.C2_s2,
  ri_fpgf.C2_s2 = ri_fpgf.C2_s2,
  rf_fpgt.C2_s2 = rf_fpgt.C2_s2,
  rf_fpgf.C2_s2 = rf_fpgf.C2_s2
)
write.csv(results_C1000_s2, file = ".../Simulation 2/results_C1000_s2.csv", row.names = FALSE)

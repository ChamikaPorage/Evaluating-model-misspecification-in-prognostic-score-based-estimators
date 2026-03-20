############################
# Run file for Simulation 1#
############################
library(xtable)

##########
#DESIGN A#
##########

source("..../Simulation 1/Sim1_DesA_cf.R")
source("..../Simulation 1/Estimators_cf.R")
source("..../Simulation 1/matching_estimators.R")

N <- 1000
seed <- 2025
simA2 <- gen.data.A(N,  seed)

estim.A2 <- estimators(simA2)

ri_pgt.A2 <- estim.A2[, 1]
ri_pgf.A2 <- estim.A2[, 2]
rf_pgt.A2 <- estim.A2[, 3]
rf_pgf.A2 <- estim.A2[, 4]
ri_fpgt.A2 <- estim.A2[, 5]
ri_fpgf.A2 <- estim.A2[, 6]
rf_fpgt.A2 <- estim.A2[, 7]
rf_fpgf.A2 <- estim.A2[, 8]

match.A2 <- matching_estimators(simA2)

mat_lin_pgs_t.A2 <- match.A2[, 1]
mat_lin_pgs_f.A2 <- match.A2[, 2]
mat_nn_pgs_t.A2 <- match.A2[, 3]
mat_nn_pgs_f.A2 <- match.A2[, 4]
mat_lin_fpgs_t.A2 <- match.A2[, 5]
mat_lin_fpgs_f.A2 <- match.A2[, 6]
mat_nn_fpgs_t.A2 <- match.A2[, 7]
mat_nn_fpgs_f.A2 <- match.A2[, 8]

##########
#DESIGN B#
##########
source("..../Simulation 1/Sim1_DesB_cf.R")

N <- 1000
seed <- 2025
simB2 <- gen.data.B(N,  seed)

estim.B2 <- estimators(simB2)

ri_pgt.B2 <- estim.B2[, 1]
ri_pgf.B2 <- estim.B2[, 2]
rf_pgt.B2 <- estim.B2[, 3]
rf_pgf.B2 <- estim.B2[, 4]
ri_fpgt.B2 <- estim.B2[, 5]
ri_fpgf.B2 <- estim.B2[, 6]
rf_fpgt.B2 <- estim.B2[, 7]
rf_fpgf.B2 <- estim.B2[, 8]

match.B2 <- matching_estimators(simB2)

mat_lin_pgs_t.B2 <- match.B2[, 1]
mat_lin_pgs_f.B2 <- match.B2[, 2]
mat_nn_pgs_t.B2 <- match.B2[, 3]
mat_nn_pgs_f.B2 <- match.B2[, 4]
mat_lin_fpgs_t.B2 <- match.B2[, 5]
mat_lin_fpgs_f.B2 <- match.B2[, 6]
mat_nn_fpgs_t.B2 <- match.B2[, 7]
mat_nn_fpgs_f.B2 <- match.B2[, 8]

###########
# Design C#
###########
source("..../Simulation 1/Sim1_DesC_cf.R")

N <- 1000
seed <- 2025
simC2 <- gen.data.C(N,  seed)

estim.C2 <- estimators(simC2)

ri_pgt.C2 <- estim.C2[, 1]
ri_pgf.C2 <- estim.C2[, 2]
rf_pgt.C2 <- estim.C2[, 3]
rf_pgf.C2 <- estim.C2[, 4]
ri_fpgt.C2 <- estim.C2[, 5]
ri_fpgf.C2 <- estim.C2[, 6]
rf_fpgt.C2 <- estim.C2[, 7]
rf_fpgf.C2 <- estim.C2[, 8]

match.C2 <- matching_estimators(simC2)

mat_lin_pgs_t.C2 <- match.C2[, 1]
mat_lin_pgs_f.C2 <- match.C2[, 2]
mat_nn_pgs_t.C2 <- match.C2[, 3]
mat_nn_pgs_f.C2 <- match.C2[, 4]
mat_lin_fpgs_t.C2 <- match.C2[, 5]
mat_lin_fpgs_f.C2 <- match.C2[, 6]
mat_nn_fpgs_t.C2 <- match.C2[, 7]
mat_nn_fpgs_f.C2 <- match.C2[, 8]

#saving data 

# Prepare the results for latex table

True.A2 <- round(cbind(
  mean(ri_pgt.A2) - 3, sd(ri_pgt.A2), mean((ri_pgt.A2 - 3)^2), 
  mean(rf_pgt.A2) - 3, sd(rf_pgt.A2), mean((rf_pgt.A2 - 3)^2), 
  mean(ri_fpgt.A2) - 3, sd(ri_fpgt.A2), mean((ri_fpgt.A2 - 3)^2), 
  mean(rf_fpgt.A2) - 3, sd(rf_fpgt.A2), mean((rf_fpgt.A2 - 3)^2)), 
  digits = 3
)

False.A2 <- round(cbind(
  mean(ri_pgf.A2) - 3, sd(ri_pgf.A2), mean((ri_pgf.A2 - 3)^2), 
  mean(rf_pgf.A2) - 3, sd(rf_pgf.A2), mean((rf_pgf.A2 - 3)^2), 
  mean(ri_fpgf.A2) - 3, sd(ri_fpgf.A2), mean((ri_fpgf.A2 - 3)^2), 
  mean(rf_fpgf.A2) - 3, sd(rf_fpgf.A2), mean((rf_fpgf.A2 - 3)^2)), 
  digits = 3
)

True.B2 <- round(cbind(
  mean(ri_pgt.B2) - 3, sd(ri_pgt.B2), mean((ri_pgt.B2 - 3)^2), 
  mean(rf_pgt.B2) - 3, sd(rf_pgt.B2), mean((rf_pgt.B2 - 3)^2), 
  mean(ri_fpgt.B2) - 3, sd(ri_fpgt.B2), mean((ri_fpgt.B2 - 3)^2), 
  mean(rf_fpgt.B2) - 3, sd(rf_fpgt.B2), mean((rf_fpgt.B2 - 3)^2)), 
  digits = 3
)

False.B2 <- round(cbind(
  mean(ri_pgf.B2) - 3, sd(ri_pgf.B2), mean((ri_pgf.B2 - 3)^2), 
  mean(rf_pgf.B2) - 3, sd(rf_pgf.B2), mean((rf_pgf.B2 - 3)^2), 
  mean(ri_fpgf.B2) - 3, sd(ri_fpgf.B2), mean((ri_fpgf.B2 - 3)^2), 
  mean(rf_fpgf.B2) - 3, sd(rf_fpgf.B2), mean((rf_fpgf.B2 - 3)^2)), 
  digits = 3
)
True.C2 <- round(cbind(
  mean(ri_pgt.C2) - 3, sd(ri_pgt.C2), mean((ri_pgt.C2 - 3)^2), 
  mean(rf_pgt.C2) - 3, sd(rf_pgt.C2), mean((rf_pgt.C2 - 3)^2), 
  mean(ri_fpgt.C2) - 3, sd(ri_fpgt.C2), mean((ri_fpgt.C2 - 3)^2), 
  mean(rf_fpgt.C2) - 3, sd(rf_fpgt.C2), mean((rf_fpgt.C2 - 3)^2)), 
  digits = 3
)

False.C2 <- round(cbind(
  mean(ri_pgf.C2) - 3, sd(ri_pgf.C2), mean((ri_pgf.C2 - 3)^2), 
  mean(rf_pgf.C2) - 3, sd(rf_pgf.C2), mean((rf_pgf.C2 - 3)^2), 
  mean(ri_fpgf.C2) - 3, sd(ri_fpgf.C2), mean((ri_fpgf.C2 - 3)^2), 
  mean(rf_fpgf.C2) - 3, sd(rf_fpgf.C2), mean((rf_fpgf.C2 - 3)^2)), 
  digits = 3
)


MAT.A2 <- round(cbind(
  mean(mat_lin_pgs_t.A2) - 3, sd(mat_lin_pgs_t.A2), mean((mat_lin_pgs_t.A2 - 3)^2),
  mean(mat_lin_pgs_f.A2) - 3, sd(mat_lin_pgs_f.A2), mean((mat_lin_pgs_f.A2 - 3)^2), 
  mean(mat_nn_pgs_t.A2) - 3, sd(mat_nn_pgs_t.A2), mean((mat_nn_pgs_t.A2 - 3)^2),
  mean(mat_nn_pgs_f.A2) - 3, sd(mat_nn_pgs_f.A2), mean((mat_nn_pgs_f.A2 - 3)^2),
  mean(mat_lin_fpgs_t.A2) - 3, sd(mat_lin_fpgs_t.A2), mean((mat_lin_fpgs_t.A2 - 3)^2),
  mean(mat_lin_fpgs_f.A2) - 3, sd(mat_lin_fpgs_f.A2), mean((mat_lin_fpgs_f.A2 - 3)^2), 
  mean(mat_nn_fpgs_t.A2) - 3, sd(mat_nn_fpgs_t.A2), mean((mat_nn_fpgs_t.A2 - 3)^2),
  mean(mat_nn_fpgs_f.A2) - 3, sd(mat_nn_fpgs_f.A2), mean((mat_nn_fpgs_f.A2 - 3)^2)),
  digits = 3
)

MAT.B2 <- round(cbind(
  mean(mat_lin_pgs_t.B2) - 3, sd(mat_lin_pgs_t.B2), mean((mat_lin_pgs_t.B2 - 3)^2),
  mean(mat_lin_pgs_f.B2) - 3, sd(mat_lin_pgs_f.B2), mean((mat_lin_pgs_f.B2 - 3)^2), 
  mean(mat_nn_pgs_t.B2) - 3, sd(mat_nn_pgs_t.B2), mean((mat_nn_pgs_t.B2 - 3)^2),
  mean(mat_nn_pgs_f.B2) - 3, sd(mat_nn_pgs_f.B2), mean((mat_nn_pgs_f.B2 - 3)^2),
  mean(mat_lin_fpgs_t.B2) - 3, sd(mat_lin_fpgs_t.B2), mean((mat_lin_fpgs_t.B2 - 3)^2),
  mean(mat_lin_fpgs_f.B2) - 3, sd(mat_lin_fpgs_f.B2), mean((mat_lin_fpgs_f.B2 - 3)^2), 
  mean(mat_nn_fpgs_t.B2) - 3, sd(mat_nn_fpgs_t.B2), mean((mat_nn_fpgs_t.B2 - 3)^2),
  mean(mat_nn_fpgs_f.B2) - 3, sd(mat_nn_fpgs_f.B2), mean((mat_nn_fpgs_f.B2 - 3)^2)),
  digits = 3
)

MAT.C2 <- round(cbind(
  mean(mat_lin_pgs_t.C2) - 3, sd(mat_lin_pgs_t.C2), mean((mat_lin_pgs_t.C2 - 3)^2),
  mean(mat_lin_pgs_f.C2) - 3, sd(mat_lin_pgs_f.C2), mean((mat_lin_pgs_f.C2 - 3)^2), 
  mean(mat_nn_pgs_t.C2) - 3, sd(mat_nn_pgs_t.C2), mean((mat_nn_pgs_t.C2 - 3)^2),
  mean(mat_nn_pgs_f.C2) - 3, sd(mat_nn_pgs_f.C2), mean((mat_nn_pgs_f.C2 - 3)^2),
  mean(mat_lin_fpgs_t.C2) - 3, sd(mat_lin_fpgs_t.C2), mean((mat_lin_fpgs_t.C2 - 3)^2),
  mean(mat_lin_fpgs_f.C2) - 3, sd(mat_lin_fpgs_f.C2), mean((mat_lin_fpgs_f.C2 - 3)^2), 
  mean(mat_nn_fpgs_t.C2) - 3, sd(mat_nn_fpgs_t.C2), mean((mat_nn_fpgs_t.C2 - 3)^2),
  mean(mat_nn_fpgs_f.C2) - 3, sd(mat_nn_fpgs_f.C2), mean((mat_nn_fpgs_f.C2 - 3)^2)),
  digits = 3
)


#saving data
results_A1000_s1_ri <- data.frame(
  ri_pgt.A2 = ri_pgt.A2,
  ri_pgf.A2 = ri_pgf.A2,
  rf_pgt.A2 = rf_pgt.A2,
  rf_pgf.A2 = rf_pgf.A2,
  ri_fpgt.A2 = ri_fpgt.A2,
  ri_fpgf.A2 = ri_fpgf.A2,
  rf_fpgt.A2 = rf_fpgt.A2,
  rf_fpgf.A2 = rf_fpgf.A2
)
write.csv(results_A1000_s1_ri, file = "..../Simulation 1/results_A1000_s1_ri.csv", row.names = FALSE)

results_B1000_s1_ri <- data.frame(
  ri_pgt.B2 = ri_pgt.B2,
  ri_pgf.B2 = ri_pgf.B2,
  rf_pgt.B2 = rf_pgt.B2,
  rf_pgf.B2 = rf_pgf.B2,
  ri_fpgt.B2 = ri_fpgt.B2,
  ri_fpgf.B2 = ri_fpgf.B2,
  rf_fpgt.B2 = rf_fpgt.B2,
  rf_fpgf.B2 = rf_fpgf.B2
)
write.csv(results_B1000_s1_ri, file = "..../Simulation 1/results_B1000_s1_ri.csv", row.names = FALSE)

results_C1000_s1_ri <- data.frame(
  ri_pgt.C2 = ri_pgt.C2,
  ri_pgf.C2 = ri_pgf.C2,
  rf_pgt.C2 = rf_pgt.C2,
  rf_pgf.C2 = rf_pgf.C2,
  ri_fpgt.C2 = ri_fpgt.C2,
  ri_fpgf.C2 = ri_fpgf.C2,
  rf_fpgt.C2 = rf_fpgt.C2,
  rf_fpgf.C2 = rf_fpgf.C2
)
write.csv(results_C1000_s1_ri, file = "..../Simulation 1/results_C1000_s1_ri.csv", row.names = FALSE)

results_A1000_s1_mat <- data.frame(
  mat_lin_pgs_t.A2 = mat_lin_pgs_t.A2,
  mat_lin_pgs_f.A2 = mat_lin_pgs_f.A2,
  mat_nn_pgs_t.A2 = mat_nn_pgs_t.A2,
  mat_nn_pgs_f.A2 = mat_nn_pgs_f.A2,
  mat_lin_fpgs_t.A2 = mat_lin_fpgs_t.A2,
  mat_lin_fpgs_f.A2 = mat_lin_fpgs_f.A2,
  mat_nn_fpgs_t.A2 = mat_nn_fpgs_t.A2,
  mat_nn_fpgs_f.A2 = mat_nn_fpgs_f.A2
)
write.csv(results_A1000_s1_mat, file = "..../Simulation 1/results_A1000_s1_mat.csv", row.names = FALSE)

results_B1000_s1_mat <- data.frame(
  mat_lin_pgs_t.B2 = mat_lin_pgs_t.B2,
  mat_lin_pgs_f.B2 = mat_lin_pgs_f.B2,
  mat_nn_pgs_t.B2 = mat_nn_pgs_t.B2,
  mat_nn_pgs_f.B2 = mat_nn_pgs_f.B2,
  mat_lin_fpgs_t.B2 = mat_lin_fpgs_t.B2,
  mat_lin_fpgs_f.B2 = mat_lin_fpgs_f.B2,
  mat_nn_fpgs_t.B2 = mat_nn_fpgs_t.B2,
  mat_nn_fpgs_f.B2 = mat_nn_fpgs_f.B2
)
write.csv(results_B1000_s1_mat, file = "..../Simulation 1/results_B1000_s1_mat.csv", row.names = FALSE)

results_C1000_s1_mat <- data.frame(
  mat_lin_pgs_t.C2 = mat_lin_pgs_t.C2,
  mat_lin_pgs_f.C2 = mat_lin_pgs_f.C2,
  mat_nn_pgs_t.C2 = mat_nn_pgs_t.C2,
  mat_nn_pgs_f.C2 = mat_nn_pgs_f.C2,
  mat_lin_fpgs_t.C2 = mat_lin_fpgs_t.C2,
  mat_lin_fpgs_f.C2 = mat_lin_fpgs_f.C2,
  mat_nn_fpgs_t.C2 = mat_nn_fpgs_t.C2,
  mat_nn_fpgs_f.C2 = mat_nn_fpgs_f.C2
)
write.csv(results_C1000_s1_mat, file = "..../Simulation 1/results_C1000_s1_mat.csv", row.names = FALSE)




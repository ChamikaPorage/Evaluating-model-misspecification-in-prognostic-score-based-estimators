############################
# Run file for Simulation 2#
############################


##########
#DESIGN A#
##########

source(".../Simulation 2/Sim2_DesA_cf.R")
source(".../Simulation 2/Estimators_cf.R")
source(".../Simulation 2/matching_estimators.R")

N <- 500
seed <- 2025
simA2 <- gen.data.A2(N,  seed)

estim.A_s2 <- estimators(simA2)

ri_pgt.A_s2 <- estim.A_s2[, 1]
ri_pgf.A_s2 <- estim.A_s2[, 2]
rf_pgt.A_s2 <- estim.A_s2[, 3]
rf_pgf.A_s2 <- estim.A_s2[, 4]
ri_fpgt.A_s2 <- estim.A_s2[, 5]
ri_fpgf.A_s2 <- estim.A_s2[, 6]
rf_fpgt.A_s2 <- estim.A_s2[, 7]
rf_fpgf.A_s2 <- estim.A_s2[, 8]

match.A_s2 <- matching_estimators(simA2)

mat_lin_pgs_t.A_s2 <- match.A_s2[, 1]
mat_lin_pgs_f.A_s2 <- match.A_s2[, 2]
mat_nn_pgs_t.A_s2 <- match.A_s2[, 3]
mat_nn_pgs_f.A_s2 <- match.A_s2[, 4]
mat_lin_fpgs_t.A_s2 <- match.A_s2[, 5]
mat_lin_fpgs_f.A_s2 <- match.A_s2[, 6]
mat_nn_fpgs_t.A_s2 <- match.A_s2[, 7]
mat_nn_fpgs_f.A_s2 <- match.A_s2[, 8]

##########
#DESIGN B#
##########
source("..../Simulation 2/Sim2_DesB_cf.R")
source("..../Simulation 2/Estimators_cf.R")
source("..../Simulation 2/matching_estimators.R")

N <- 500
seed <- 2025
simB2 <- gen.data.B2(N,  seed)

estim.B_s2 <- estimators(simB2)

ri_pgt.B_s2 <- estim.B_s2[, 1]
ri_pgf.B_s2 <- estim.B_s2[, 2]
rf_pgt.B_s2 <- estim.B_s2[, 3]
rf_pgf.B_s2 <- estim.B_s2[, 4]
ri_fpgt.B_s2 <- estim.B_s2[, 5]
ri_fpgf.B_s2 <- estim.B_s2[, 6]
rf_fpgt.B_s2 <- estim.B_s2[, 7]
rf_fpgf.B_s2 <- estim.B_s2[, 8]

match.B_s2 <- matching_estimators(simB2)

mat_lin_pgs_t.B_s2 <- match.B_s2[, 1]
mat_lin_pgs_f.B_s2 <- match.B_s2[, 2]
mat_nn_pgs_t.B_s2 <- match.B_s2[, 3]
mat_nn_pgs_f.B_s2 <- match.B_s2[, 4]
mat_lin_fpgs_t.B_s2 <- match.B_s2[, 5]
mat_lin_fpgs_f.B_s2 <- match.B_s2[, 6]
mat_nn_fpgs_t.B_s2 <- match.B_s2[, 7]
mat_nn_fpgs_f.B_s2 <- match.B_s2[, 8]

###########
# Design C#
###########
source("..../Simulation 2/Sim2_DesC_cf.R")
source("..../Simulation 2/Estimators_cf.R")
source("..../Simulation 2/matching_estimators.R")

N <- 500
seed <- 2025
simC2 <- gen.data.C2(N,  seed)

estim.C_s2 <- estimators(simC2)

ri_pgt.C_s2 <- estim.C_s2[, 1]
ri_pgf.C_s2 <- estim.C_s2[, 2]
rf_pgt.C_s2 <- estim.C_s2[, 3]
rf_pgf.C_s2 <- estim.C_s2[, 4]
ri_fpgt.C_s2 <- estim.C_s2[, 5]
ri_fpgf.C_s2 <- estim.C_s2[, 6]
rf_fpgt.C_s2 <- estim.C_s2[, 7]
rf_fpgf.C_s2 <- estim.C_s2[, 8]

match.C_s2 <- matching_estimators(simC2)

mat_lin_pgs_t.C_s2 <- match.C_s2[, 1]
mat_lin_pgs_f.C_s2 <- match.C_s2[, 2]
mat_nn_pgs_t.C_s2 <- match.C_s2[, 3]
mat_nn_pgs_f.C_s2 <- match.C_s2[, 4]
mat_lin_fpgs_t.C_s2 <- match.C_s2[, 5]
mat_lin_fpgs_f.C_s2 <- match.C_s2[, 6]
mat_nn_fpgs_t.C_s2 <- match.C_s2[, 7]
mat_nn_fpgs_f.C_s2 <- match.C_s2[, 8]

# Prepare the results for latex table

True.A_s2 <- round(cbind(
  mean(ri_pgt.A_s2) - 3.7, sd(ri_pgt.A_s2), mean((ri_pgt.A_s2 - 3.7)^2), 
  mean(rf_pgt.A_s2) - 3.7, sd(rf_pgt.A_s2), mean((rf_pgt.A_s2 - 3.7)^2), 
  mean(ri_fpgt.A_s2) - 3.7, sd(ri_fpgt.A_s2), mean((ri_fpgt.A_s2 - 3.7)^2), 
  mean(rf_fpgt.A_s2) - 3.7, sd(rf_fpgt.A_s2), mean((rf_fpgt.A_s2 - 3.7)^2)), 
  digits = 3
)

False.A_s2 <- round(cbind(
  mean(ri_pgf.A_s2) - 3.7, sd(ri_pgf.A_s2), mean((ri_pgf.A_s2 - 3.7)^2), 
  mean(rf_pgf.A_s2) - 3.7, sd(rf_pgf.A_s2), mean((rf_pgf.A_s2 - 3.7)^2), 
  mean(ri_fpgf.A_s2) - 3.7, sd(ri_fpgf.A_s2), mean((ri_fpgf.A_s2 - 3.7)^2), 
  mean(rf_fpgf.A_s2) - 3.7, sd(rf_fpgf.A_s2), mean((rf_fpgf.A_s2 - 3.7)^2)), 
  digits = 3
)

True.B_s2 <- round(cbind(
  mean(ri_pgt.B_s2) - 3.7, sd(ri_pgt.B_s2), mean((ri_pgt.B_s2 - 3.7)^2), 
  mean(rf_pgt.B_s2) - 3.7, sd(rf_pgt.B_s2), mean((rf_pgt.B_s2 - 3.7)^2), 
  mean(ri_fpgt.B_s2) - 3.7, sd(ri_fpgt.B_s2), mean((ri_fpgt.B_s2 - 3.7)^2), 
  mean(rf_fpgt.B_s2) - 3.7, sd(rf_fpgt.B_s2), mean((rf_fpgt.B_s2 - 3.7)^2)), 
  digits = 3
)

False.B_s2 <- round(cbind(
  mean(ri_pgf.B_s2) - 3.7, sd(ri_pgf.B_s2), mean((ri_pgf.B_s2 - 3.7)^2), 
  mean(rf_pgf.B_s2) - 3.7, sd(rf_pgf.B_s2), mean((rf_pgf.B_s2 - 3.7)^2), 
  mean(ri_fpgf.B_s2) - 3.7, sd(ri_fpgf.B_s2), mean((ri_fpgf.B_s2 - 3.7)^2), 
  mean(rf_fpgf.B_s2) - 3.7, sd(rf_fpgf.B_s2), mean((rf_fpgf.B_s2 - 3.7)^2)), 
  digits = 3
)

True.C_s2 <- round(cbind(
  mean(ri_pgt.C_s2) - 3.7, sd(ri_pgt.C_s2), mean((ri_pgt.C_s2 - 3.7)^2), 
  mean(rf_pgt.C_s2) - 3.7, sd(rf_pgt.C_s2), mean((rf_pgt.C_s2 - 3.7)^2), 
  mean(ri_fpgt.C_s2) - 3.7, sd(ri_fpgt.C_s2), mean((ri_fpgt.C_s2 - 3.7)^2), 
  mean(rf_fpgt.C_s2) - 3.7, sd(rf_fpgt.C_s2), mean((rf_fpgt.C_s2 - 3.7)^2)), 
  digits = 3
)

False.C_s2 <- round(cbind(
  mean(ri_pgf.C_s2) - 3.7, sd(ri_pgf.C_s2), mean((ri_pgf.C_s2 - 3.7)^2), 
  mean(rf_pgf.C_s2) - 3.7, sd(rf_pgf.C_s2), mean((rf_pgf.C_s2 - 3.7)^2), 
  mean(ri_fpgf.C_s2) - 3.7, sd(ri_fpgf.C_s2), mean((ri_fpgf.C_s2 - 3.7)^2), 
  mean(rf_fpgf.C_s2) - 3.7, sd(rf_fpgf.C_s2), mean((rf_fpgf.C_s2 - 3.7)^2)), 
  digits = 3
)

MAT.A_s2 <- round(cbind(
  mean(mat_lin_pgs_t.A_s2) - 3.7, sd(mat_lin_pgs_t.A_s2), mean((mat_lin_pgs_t.A_s2 - 3.7)^2),
  mean(mat_lin_pgs_f.A_s2) - 3.7, sd(mat_lin_pgs_f.A_s2), mean((mat_lin_pgs_f.A_s2 - 3.7)^2), 
  mean(mat_nn_pgs_t.A_s2) - 3.7, sd(mat_nn_pgs_t.A_s2), mean((mat_nn_pgs_t.A_s2 - 3.7)^2),
  mean(mat_nn_pgs_f.A_s2) - 3.7, sd(mat_nn_pgs_f.A_s2), mean((mat_nn_pgs_f.A_s2 - 3.7)^2),
  mean(mat_lin_fpgs_t.A_s2) - 3.7, sd(mat_lin_fpgs_t.A_s2), mean((mat_lin_fpgs_t.A_s2 - 3.7)^2),
  mean(mat_lin_fpgs_f.A_s2) - 3.7, sd(mat_lin_fpgs_f.A_s2), mean((mat_lin_fpgs_f.A_s2 - 3.7)^2), 
  mean(mat_nn_fpgs_t.A_s2) - 3.7, sd(mat_nn_fpgs_t.A_s2), mean((mat_nn_fpgs_t.A_s2 - 3.7)^2),
  mean(mat_nn_fpgs_f.A_s2) - 3.7, sd(mat_nn_fpgs_f.A_s2), mean((mat_nn_fpgs_f.A_s2 - 3.7)^2)),
  digits = 3
)

MAT.B_s2 <- round(cbind(
  mean(mat_lin_pgs_t.B_s2) - 3.7, sd(mat_lin_pgs_t.B_s2), mean((mat_lin_pgs_t.B_s2 - 3.7)^2),
  mean(mat_lin_pgs_f.B_s2) - 3.7, sd(mat_lin_pgs_f.B_s2), mean((mat_lin_pgs_f.B_s2 - 3.7)^2), 
  mean(mat_nn_pgs_t.B_s2) - 3.7, sd(mat_nn_pgs_t.B_s2), mean((mat_nn_pgs_t.B_s2 - 3.7)^2),
  mean(mat_nn_pgs_f.B_s2) - 3.7, sd(mat_nn_pgs_f.B_s2), mean((mat_nn_pgs_f.B_s2 - 3.7)^2),
  mean(mat_lin_fpgs_t.B_s2) - 3.7, sd(mat_lin_fpgs_t.B_s2), mean((mat_lin_fpgs_t.B_s2 - 3.7)^2),
  mean(mat_lin_fpgs_f.B_s2) - 3.7, sd(mat_lin_fpgs_f.B_s2), mean((mat_lin_fpgs_f.B_s2 - 3.7)^2), 
  mean(mat_nn_fpgs_t.B_s2) - 3.7, sd(mat_nn_fpgs_t.B_s2), mean((mat_nn_fpgs_t.B_s2 - 3.7)^2),
  mean(mat_nn_fpgs_f.B_s2) - 3.7, sd(mat_nn_fpgs_f.B_s2), mean((mat_nn_fpgs_f.B_s2 - 3.7)^2)),
  digits = 3
)

MAT.C_s2 <- round(cbind(
  mean(mat_lin_pgs_t.C_s2) - 3.7, sd(mat_lin_pgs_t.C_s2), mean((mat_lin_pgs_t.C_s2 - 3.7)^2),
  mean(mat_lin_pgs_f.C_s2) - 3.7, sd(mat_lin_pgs_f.C_s2), mean((mat_lin_pgs_f.C_s2 - 3.7)^2), 
  mean(mat_nn_pgs_t.C_s2) - 3.7, sd(mat_nn_pgs_t.C_s2), mean((mat_nn_pgs_t.C_s2 - 3.7)^2),
  mean(mat_nn_pgs_f.C_s2) - 3.7, sd(mat_nn_pgs_f.C_s2), mean((mat_nn_pgs_f.C_s2 - 3.7)^2),
  mean(mat_lin_fpgs_t.C_s2) - 3.7, sd(mat_lin_fpgs_t.C_s2), mean((mat_lin_fpgs_t.C_s2 - 3.7)^2),
  mean(mat_lin_fpgs_f.C_s2) - 3.7, sd(mat_lin_fpgs_f.C_s2), mean((mat_lin_fpgs_f.C_s2 - 3.7)^2), 
  mean(mat_nn_fpgs_t.C_s2) - 3.7, sd(mat_nn_fpgs_t.C_s2), mean((mat_nn_fpgs_t.C_s2 - 3.7)^2),
  mean(mat_nn_fpgs_f.C_s2) - 3.7, sd(mat_nn_fpgs_f.C_s2), mean((mat_nn_fpgs_f.C_s2 - 3.7)^2)),
  digits = 3
)

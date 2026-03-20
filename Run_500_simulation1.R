############################
# Run file for Simulation 1#
############################

##########
#DESIGN A#
##########

source("..../Simulation 1/Sim1_DesA_cf.R")
source("..../Simulation 1/RI_estimators.R")
source("..../Simulation 1/matching_estimators.R")

N <- 500
seed <- 2025
simA <- gen.data.A(N,  seed)

estim.A <- estimators(simA)

ri_pgt.A <- estim.A[, 1]
ri_pgf.A <- estim.A[, 2]
rf_pgt.A <- estim.A[, 3]
rf_pgf.A <- estim.A[, 4]
ri_fpgt.A <- estim.A[, 5]
ri_fpgf.A <- estim.A[, 6]
rf_fpgt.A <- estim.A[, 7]
rf_fpgf.A <- estim.A[, 8]

match.A <- matching_estimators(simA)

mat_lin_pgs_t.A <- match.A[, 1]
mat_lin_pgs_f.A <- match.A[, 2]
mat_nn_pgs_t.A <- match.A[, 3]
mat_nn_pgs_f.A <- match.A[, 4]
mat_lin_fpgs_t.A <- match.A[, 5]
mat_lin_fpgs_f.A <- match.A[, 6]
mat_nn_fpgs_t.A <- match.A[, 7]
mat_nn_fpgs_f.A <- match.A[, 8]

##########
#DESIGN B#
##########
source("..../Simulation 1/Sim1_DesB_cf.R")

N <- 500
seed <- 2025
simB <- gen.data.B(N,  seed)

estim.B <- estimators(simB)

ri_pgt.B <- estim.B[, 1]
ri_pgf.B <- estim.B[, 2]
rf_pgt.B <- estim.B[, 3]
rf_pgf.B <- estim.B[, 4]
ri_fpgt.B <- estim.B[, 5]
ri_fpgf.B <- estim.B[, 6]
rf_fpgt.B <- estim.B[, 7]
rf_fpgf.B <- estim.B[, 8]

match.B <- matching_estimators(simB)

mat_lin_pgs_t.B <- match.B[, 1]
mat_lin_pgs_f.B <- match.B[, 2]
mat_nn_pgs_t.B <- match.B[, 3]
mat_nn_pgs_f.B <- match.B[, 4]
mat_lin_fpgs_t.B <- match.B[, 5]
mat_lin_fpgs_f.B <- match.B[, 6]
mat_nn_fpgs_t.B <- match.B[, 7]
mat_nn_fpgs_f.B <- match.B[, 8]

###########
# Design C#
###########
source("..../Simulation 1/Sim1_DesC_cf.R")

N <- 500
seed <- 2025
simC <- gen.data.C(N,  seed)

estim.C <- estimators(simC)

ri_pgt.C <- estim.C[, 1]
ri_pgf.C <- estim.C[, 2]
rf_pgt.C <- estim.C[, 3]
rf_pgf.C <- estim.C[, 4]
ri_fpgt.C <- estim.C[, 5]
ri_fpgf.C <- estim.C[, 6]
rf_fpgt.C <- estim.C[, 7]
rf_fpgf.C <- estim.C[, 8]

match.C <- matching_estimators(simC)

mat_lin_pgs_t.C <- match.C[, 1]
mat_lin_pgs_f.C <- match.C[, 2]
mat_nn_pgs_t.C <- match.C[, 3]
mat_nn_pgs_f.C <- match.C[, 4]
mat_lin_fpgs_t.C <- match.C[, 5]
mat_lin_fpgs_f.C <- match.C[, 6]
mat_nn_fpgs_t.C <- match.C[, 7]
mat_nn_fpgs_f.C <- match.C[, 8]

# Prepare the results for latex table

True.A <- round(cbind(
  mean(ri_pgt.A) - 3, sd(ri_pgt.A), mean((ri_pgt.A - 3)^2), 
  mean(rf_pgt.A) - 3, sd(rf_pgt.A), mean((rf_pgt.A - 3)^2), 
  mean(ri_fpgt.A) - 3, sd(ri_fpgt.A), mean((ri_fpgt.A - 3)^2), 
  mean(rf_fpgt.A) - 3, sd(rf_fpgt.A), mean((rf_fpgt.A - 3)^2)), 
  digits = 3
)

False.A <- round(cbind(
  mean(ri_pgf.A) - 3, sd(ri_pgf.A), mean((ri_pgf.A - 3)^2), 
  mean(rf_pgf.A) - 3, sd(rf_pgf.A), mean((rf_pgf.A - 3)^2), 
  mean(ri_fpgf.A) - 3, sd(ri_fpgf.A), mean((ri_fpgf.A - 3)^2), 
  mean(rf_fpgf.A) - 3, sd(rf_fpgf.A), mean((rf_fpgf.A - 3)^2)), 
  digits = 3
)

True.B <- round(cbind(
  mean(ri_pgt.B) - 3, sd(ri_pgt.B), mean((ri_pgt.B - 3)^2), 
  mean(rf_pgt.B) - 3, sd(rf_pgt.B), mean((rf_pgt.B - 3)^2), 
  mean(ri_fpgt.B) - 3, sd(ri_fpgt.B), mean((ri_fpgt.B - 3)^2), 
  mean(rf_fpgt.B) - 3, sd(rf_fpgt.B), mean((rf_fpgt.B - 3)^2)), 
  digits = 3
)

False.B <- round(cbind(
  mean(ri_pgf.B) - 3, sd(ri_pgf.B), mean((ri_pgf.B - 3)^2), 
  mean(rf_pgf.B) - 3, sd(rf_pgf.B), mean((rf_pgf.B - 3)^2), 
  mean(ri_fpgf.B) - 3, sd(ri_fpgf.B), mean((ri_fpgf.B - 3)^2), 
  mean(rf_fpgf.B) - 3, sd(rf_fpgf.B), mean((rf_fpgf.B - 3)^2)), 
  digits = 3
)
True.C <- round(cbind(
  mean(ri_pgt.C) - 3, sd(ri_pgt.C), mean((ri_pgt.C - 3)^2), 
  mean(rf_pgt.C) - 3, sd(rf_pgt.C), mean((rf_pgt.C - 3)^2), 
  mean(ri_fpgt.C) - 3, sd(ri_fpgt.C), mean((ri_fpgt.C - 3)^2), 
  mean(rf_fpgt.C) - 3, sd(rf_fpgt.C), mean((rf_fpgt.C - 3)^2)), 
  digits = 3
)

False.C <- round(cbind(
  mean(ri_pgf.C) - 3, sd(ri_pgf.C), mean((ri_pgf.C - 3)^2), 
  mean(rf_pgf.C) - 3, sd(rf_pgf.C), mean((rf_pgf.C - 3)^2), 
  mean(ri_fpgf.C) - 3, sd(ri_fpgf.C), mean((ri_fpgf.C - 3)^2), 
  mean(rf_fpgf.C) - 3, sd(rf_fpgf.C), mean((rf_fpgf.C - 3)^2)), 
  digits = 3
)


MAT.A <- round(cbind(
  mean(mat_lin_pgs_t.A) - 3, sd(mat_lin_pgs_t.A), mean((mat_lin_pgs_t.A - 3)^2),
  mean(mat_lin_pgs_f.A) - 3, sd(mat_lin_pgs_f.A), mean((mat_lin_pgs_f.A - 3)^2), 
  mean(mat_nn_pgs_t.A) - 3, sd(mat_nn_pgs_t.A), mean((mat_nn_pgs_t.A - 3)^2),
  mean(mat_nn_pgs_f.A) - 3, sd(mat_nn_pgs_f.A), mean((mat_nn_pgs_f.A - 3)^2),
  mean(mat_lin_fpgs_t.A) - 3, sd(mat_lin_fpgs_t.A), mean((mat_lin_fpgs_t.A - 3)^2),
  mean(mat_lin_fpgs_f.A) - 3, sd(mat_lin_fpgs_f.A), mean((mat_lin_fpgs_f.A - 3)^2), 
  mean(mat_nn_fpgs_t.A) - 3, sd(mat_nn_fpgs_t.A), mean((mat_nn_fpgs_t.A - 3)^2),
  mean(mat_nn_fpgs_f.A) - 3, sd(mat_nn_fpgs_f.A), mean((mat_nn_fpgs_f.A - 3)^2)),
  digits = 3
)

MAT.B <- round(cbind(
  mean(mat_lin_pgs_t.B) - 3, sd(mat_lin_pgs_t.B), mean((mat_lin_pgs_t.B - 3)^2),
  mean(mat_lin_pgs_f.B) - 3, sd(mat_lin_pgs_f.B), mean((mat_lin_pgs_f.B - 3)^2), 
  mean(mat_nn_pgs_t.B) - 3, sd(mat_nn_pgs_t.B), mean((mat_nn_pgs_t.B - 3)^2),
  mean(mat_nn_pgs_f.B) - 3, sd(mat_nn_pgs_f.B), mean((mat_nn_pgs_f.B - 3)^2),
  mean(mat_lin_fpgs_t.B) - 3, sd(mat_lin_fpgs_t.B), mean((mat_lin_fpgs_t.B - 3)^2),
  mean(mat_lin_fpgs_f.B) - 3, sd(mat_lin_fpgs_f.B), mean((mat_lin_fpgs_f.B - 3)^2), 
  mean(mat_nn_fpgs_t.B) - 3, sd(mat_nn_fpgs_t.B), mean((mat_nn_fpgs_t.B - 3)^2),
  mean(mat_nn_fpgs_f.B) - 3, sd(mat_nn_fpgs_f.B), mean((mat_nn_fpgs_f.B - 3)^2)),
  digits = 3
)

MAT.C <- round(cbind(
  mean(mat_lin_pgs_t.C) - 3, sd(mat_lin_pgs_t.C), mean((mat_lin_pgs_t.C - 3)^2),
  mean(mat_lin_pgs_f.C) - 3, sd(mat_lin_pgs_f.C), mean((mat_lin_pgs_f.C - 3)^2), 
  mean(mat_nn_pgs_t.C) - 3, sd(mat_nn_pgs_t.C), mean((mat_nn_pgs_t.C - 3)^2),
  mean(mat_nn_pgs_f.C) - 3, sd(mat_nn_pgs_f.C), mean((mat_nn_pgs_f.C - 3)^2),
  mean(mat_lin_fpgs_t.C) - 3, sd(mat_lin_fpgs_t.C), mean((mat_lin_fpgs_t.C - 3)^2),
  mean(mat_lin_fpgs_f.C) - 3, sd(mat_lin_fpgs_f.C), mean((mat_lin_fpgs_f.C - 3)^2), 
  mean(mat_nn_fpgs_t.C) - 3, sd(mat_nn_fpgs_t.C), mean((mat_nn_fpgs_t.C - 3)^2),
  mean(mat_nn_fpgs_f.C) - 3, sd(mat_nn_fpgs_f.C), mean((mat_nn_fpgs_f.C - 3)^2)),
  digits = 3
)

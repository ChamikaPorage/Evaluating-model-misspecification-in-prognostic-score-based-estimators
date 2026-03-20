############################
# Run file for Simulation 1#
############################

##########
#DESIGN A#
##########

source("..../Simulation 1/Sim1_DesA_cf.R")
source("..../Simulation 1/Estimators_cf.R")
source("..../Simulation 1/matching_estimators.R")


N <- 3000
seed <- 2025
simA3 <- gen.data.A(N,  seed)

estim.A3 <- estimators(simA3)

ri_pgt.A3 <- estim.A3[, 1]
ri_pgf.A3 <- estim.A3[, 2]
rf_pgt.A3 <- estim.A3[, 3]
rf_pgf.A3 <- estim.A3[, 4]
ri_fpgt.A3 <- estim.A3[, 5]
ri_fpgf.A3 <- estim.A3[, 6]
rf_fpgt.A3 <- estim.A3[, 7]
rf_fpgf.A3 <- estim.A3[, 8]

match.A3 <- matching_estimators(simA3)

mat_lin_pgs_t.A3 <- match.A3[, 1]
mat_lin_pgs_f.A3 <- match.A3[, 2]
mat_nn_pgs_t.A3 <- match.A3[, 3]
mat_nn_pgs_f.A3 <- match.A3[, 4]
mat_lin_fpgs_t.A3 <- match.A3[, 5]
mat_lin_fpgs_f.A3 <- match.A3[, 6]
mat_nn_fpgs_t.A3 <- match.A3[, 7]
mat_nn_fpgs_f.A3 <- match.A3[, 8]

##########
#DESIGN B#
##########
source("..../Simulation 1/Sim1_DesB_cf.R")

N <- 3000
seed <- 2025
simB3 <- gen.data.B(N,  seed)

estim.B3 <- estimators(simB3)

ri_pgt.B3 <- estim.B3[, 1]
ri_pgf.B3 <- estim.B3[, 2]
rf_pgt.B3 <- estim.B3[, 3]
rf_pgf.B3 <- estim.B3[, 4]
ri_fpgt.B3 <- estim.B3[, 5]
ri_fpgf.B3 <- estim.B3[, 6]
rf_fpgt.B3 <- estim.B3[, 7]
rf_fpgf.B3 <- estim.B3[, 8]

match.B3 <- matching_estimators(simB3)

mat_lin_pgs_t.B3 <- match.B3[, 1]
mat_lin_pgs_f.B3 <- match.B3[, 2]
mat_nn_pgs_t.B3 <- match.B3[, 3]
mat_nn_pgs_f.B3 <- match.B3[, 4]
mat_lin_fpgs_t.B3 <- match.B3[, 5]
mat_lin_fpgs_f.B3 <- match.B3[, 6]
mat_nn_fpgs_t.B3 <- match.B3[, 7]
mat_nn_fpgs_f.B3 <- match.B3[, 8]

###########
# Design C#
###########
source("..../Simulation 1/Sim1_DesC_cf.R")

N <- 3000
seed <- 2025
simC3 <- gen.data.C(N,  seed)

estim.C3 <- estimators(simC3)

ri_pgt.C3 <- estim.C3[, 1]
ri_pgf.C3 <- estim.C3[, 2]
rf_pgt.C3 <- estim.C3[, 3]
rf_pgf.C3 <- estim.C3[, 4]
ri_fpgt.C3 <- estim.C3[, 5]
ri_fpgf.C3 <- estim.C3[, 6]
rf_fpgt.C3 <- estim.C3[, 7]
rf_fpgf.C3 <- estim.C3[, 8]

match.C3 <- matching_estimators(simC3)

mat_lin_pgs_t.C3 <- match.C3[, 1]
mat_lin_pgs_f.C3 <- match.C3[, 2]
mat_nn_pgs_t.C3 <- match.C3[, 3]
mat_nn_pgs_f.C3 <- match.C3[, 4]
mat_lin_fpgs_t.C3 <- match.C3[, 5]
mat_lin_fpgs_f.C3 <- match.C3[, 6]
mat_nn_fpgs_t.C3 <- match.C3[, 7]
mat_nn_fpgs_f.C3 <- match.C3[, 8]

# Prepare the results for latex table

True.A3 <- round(cbind(
  mean(ri_pgt.A3) - 3, sd(ri_pgt.A3), mean((ri_pgt.A3 - 3)^2), 
  mean(rf_pgt.A3) - 3, sd(rf_pgt.A3), mean((rf_pgt.A3 - 3)^2), 
  mean(ri_fpgt.A3) - 3, sd(ri_fpgt.A3), mean((ri_fpgt.A3 - 3)^2), 
  mean(rf_fpgt.A3) - 3, sd(rf_fpgt.A3), mean((rf_fpgt.A3 - 3)^2)), 
  digits = 3
)

False.A3 <- round(cbind(
  mean(ri_pgf.A3) - 3, sd(ri_pgf.A3), mean((ri_pgf.A3 - 3)^2), 
  mean(rf_pgf.A3) - 3, sd(rf_pgf.A3), mean((rf_pgf.A3 - 3)^2), 
  mean(ri_fpgf.A3) - 3, sd(ri_fpgf.A3), mean((ri_fpgf.A3 - 3)^2), 
  mean(rf_fpgf.A3) - 3, sd(rf_fpgf.A3), mean((rf_fpgf.A3 - 3)^2)), 
  digits = 3
)

True.B3 <- round(cbind(
  mean(ri_pgt.B3) - 3, sd(ri_pgt.B3), mean((ri_pgt.B3 - 3)^2), 
  mean(rf_pgt.B3) - 3, sd(rf_pgt.B3), mean((rf_pgt.B3 - 3)^2), 
  mean(ri_fpgt.B3) - 3, sd(ri_fpgt.B3), mean((ri_fpgt.B3 - 3)^2), 
  mean(rf_fpgt.B3) - 3, sd(rf_fpgt.B3), mean((rf_fpgt.B3 - 3)^2)), 
  digits = 3
)

False.B3 <- round(cbind(
  mean(ri_pgf.B3) - 3, sd(ri_pgf.B3), mean((ri_pgf.B3 - 3)^2), 
  mean(rf_pgf.B3) - 3, sd(rf_pgf.B3), mean((rf_pgf.B3 - 3)^2), 
  mean(ri_fpgf.B3) - 3, sd(ri_fpgf.B3), mean((ri_fpgf.B3 - 3)^2), 
  mean(rf_fpgf.B3) - 3, sd(rf_fpgf.B3), mean((rf_fpgf.B3 - 3)^2)), 
  digits = 3
)

True.C3 <- round(cbind(
  mean(ri_pgt.C3) - 3, sd(ri_pgt.C3), mean((ri_pgt.C3 - 3)^2), 
  mean(rf_pgt.C3) - 3, sd(rf_pgt.C3), mean((rf_pgt.C3 - 3)^2), 
  mean(ri_fpgt.C3) - 3, sd(ri_fpgt.C3), mean((ri_fpgt.C3 - 3)^2), 
  mean(rf_fpgt.C3) - 3, sd(rf_fpgt.C3), mean((rf_fpgt.C3 - 3)^2)), 
  digits = 3
)

False.C3 <- round(cbind(
  mean(ri_pgf.C3) - 3, sd(ri_pgf.C3), mean((ri_pgf.C3 - 3)^2), 
  mean(rf_pgf.C3) - 3, sd(rf_pgf.C3), mean((rf_pgf.C3 - 3)^2), 
  mean(ri_fpgf.C3) - 3, sd(ri_fpgf.C3), mean((ri_fpgf.C3 - 3)^2), 
  mean(rf_fpgf.C3) - 3, sd(rf_fpgf.C3), mean((rf_fpgf.C3 - 3)^2)), 
  digits = 3
)


MAT.A3 <- round(cbind(
  mean(mat_lin_pgs_t.A3) - 3, sd(mat_lin_pgs_t.A3), mean((mat_lin_pgs_t.A3 - 3)^2),
  mean(mat_lin_pgs_f.A3) - 3, sd(mat_lin_pgs_f.A3), mean((mat_lin_pgs_f.A3 - 3)^2), 
  mean(mat_nn_pgs_t.A3) - 3, sd(mat_nn_pgs_t.A3), mean((mat_nn_pgs_t.A3 - 3)^2),
  mean(mat_nn_pgs_f.A3) - 3, sd(mat_nn_pgs_f.A3), mean((mat_nn_pgs_f.A3 - 3)^2),
  mean(mat_lin_fpgs_t.A3) - 3, sd(mat_lin_fpgs_t.A3), mean((mat_lin_fpgs_t.A3 - 3)^2),
  mean(mat_lin_fpgs_f.A3) - 3, sd(mat_lin_fpgs_f.A3), mean((mat_lin_fpgs_f.A3 - 3)^2), 
  mean(mat_nn_fpgs_t.A3) - 3, sd(mat_nn_fpgs_t.A3), mean((mat_nn_fpgs_t.A3 - 3)^2),
  mean(mat_nn_fpgs_f.A3) - 3, sd(mat_nn_fpgs_f.A3), mean((mat_nn_fpgs_f.A3 - 3)^2)),
  digits = 3
)

MAT.B3 <- round(cbind(
  mean(mat_lin_pgs_t.B3) - 3, sd(mat_lin_pgs_t.B3), mean((mat_lin_pgs_t.B3 - 3)^2),
  mean(mat_lin_pgs_f.B3) - 3, sd(mat_lin_pgs_f.B3), mean((mat_lin_pgs_f.B3 - 3)^2), 
  mean(mat_nn_pgs_t.B3) - 3, sd(mat_nn_pgs_t.B3), mean((mat_nn_pgs_t.B3 - 3)^2),
  mean(mat_nn_pgs_f.B3) - 3, sd(mat_nn_pgs_f.B3), mean((mat_nn_pgs_f.B3 - 3)^2),
  mean(mat_lin_fpgs_t.B3) - 3, sd(mat_lin_fpgs_t.B3), mean((mat_lin_fpgs_t.B3 - 3)^2),
  mean(mat_lin_fpgs_f.B3) - 3, sd(mat_lin_fpgs_f.B3), mean((mat_lin_fpgs_f.B3 - 3)^2), 
  mean(mat_nn_fpgs_t.B3) - 3, sd(mat_nn_fpgs_t.B3), mean((mat_nn_fpgs_t.B3 - 3)^2),
  mean(mat_nn_fpgs_f.B3) - 3, sd(mat_nn_fpgs_f.B3), mean((mat_nn_fpgs_f.B3 - 3)^2)),
  digits = 3
)

MAT.C3 <- round(cbind(
  mean(mat_lin_pgs_t.C3) - 3, sd(mat_lin_pgs_t.C3), mean((mat_lin_pgs_t.C3 - 3)^2),
  mean(mat_lin_pgs_f.C3) - 3, sd(mat_lin_pgs_f.C3), mean((mat_lin_pgs_f.C3 - 3)^2), 
  mean(mat_nn_pgs_t.C3) - 3, sd(mat_nn_pgs_t.C3), mean((mat_nn_pgs_t.C3 - 3)^2),
  mean(mat_nn_pgs_f.C3) - 3, sd(mat_nn_pgs_f.C3), mean((mat_nn_pgs_f.C3 - 3)^2),
  mean(mat_lin_fpgs_t.C3) - 3, sd(mat_lin_fpgs_t.C3), mean((mat_lin_fpgs_t.C3 - 3)^2),
  mean(mat_lin_fpgs_f.C3) - 3, sd(mat_lin_fpgs_f.C3), mean((mat_lin_fpgs_f.C3 - 3)^2), 
  mean(mat_nn_fpgs_t.C3) - 3, sd(mat_nn_fpgs_t.C3), mean((mat_nn_fpgs_t.C3 - 3)^2),
  mean(mat_nn_fpgs_f.C3) - 3, sd(mat_nn_fpgs_f.C3), mean((mat_nn_fpgs_f.C3 - 3)^2)),
  digits = 3
)

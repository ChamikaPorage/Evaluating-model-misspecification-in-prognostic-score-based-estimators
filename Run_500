############################
# Run file for Simulation 1#
############################

##########
#DESIGN A#
##########

source("Simulation1_DesignA.R")
source("RI_estimators.R")
source("AIPW_estimators.R")

N <- 500
seed <- 2025
datat <- gen.data.A(N,  seed)

estim.A <- estimators(datat)

ri_pgt.A <- estim.A[, 1]
ri_pgf.A <- estim.A[, 2]
rf_pgt.A <- estim.A[, 3]
rf_pgf.A <- estim.A[, 4]
ri_fpgt.A <- estim.A[, 5]
ri_fpgf.A <- estim.A[, 6]
rf_fpgt.A <- estim.A[, 7]
rf_fpgf.A <- estim.A[, 8]

AIPW.A <- estimators_aipw(datat)

dr_pt.A <- AIPW.A[, 1]
dr_p_tp.A <- AIPW.A[, 2]
dr_p_to.A <- AIPW.A[, 3]
dr_pf.A <- AIPW.A[, 4]
dr_pt_n.A <- AIPW.A[, 5]
dr_p_tp_n.A <- AIPW.A[, 6]
dr_p_to_n.A <- AIPW.A[, 7]
dr_pf_n.A <- AIPW.A[, 8]
dr_ft.A <- AIPW.A[, 9]
dr_f_tp.A <- AIPW.A[, 10]
dr_f_to.A <- AIPW.A[, 11]
dr_ff.A <- AIPW.A[, 12]
dr_ft_n.A <- AIPW.A[, 13]
dr_f_tp_n.A <- AIPW.A[, 14]
dr_f_to_n.A <- AIPW.A[, 15]
dr_ff_n.A <- AIPW.A[, 16]


##########
#DESIGN B#
##########
source("Simulation1_DesignB.R")
source("RI_estimators.R")
source("AIPW_estimators.R")

N <- 500
seed <- 2026
datat <- gen.data.B(N,  seed)

estim.B <- estimators(datat)

ri_pgt.B <- estim.B[, 1]
ri_pgf.B <- estim.B[, 2]
rf_pgt.B <- estim.B[, 3]
rf_pgf.B <- estim.B[, 4]
ri_fpgt.B <- estim.B[, 5]
ri_fpgf.B <- estim.B[, 6]
rf_fpgt.B <- estim.B[, 7]
rf_fpgf.B <- estim.B[, 8]

AIPW.B <- estimators_aipw(datat)

dr_pt.B <- AIPW.B[, 1]
dr_p_tp.B <- AIPW.B[, 2]
dr_p_to.B <- AIPW.B[, 3]
dr_pf.B <- AIPW.B[, 4]
dr_pt_n.B <- AIPW.B[, 5]
dr_p_tp_n.B <- AIPW.B[, 6]
dr_p_to_n.B <- AIPW.B[, 7]
dr_pf_n.B <- AIPW.B[, 8]
dr_ft.B <- AIPW.B[, 9]
dr_f_tp.B <- AIPW.B[, 10]
dr_f_to.B <- AIPW.B[, 11]
dr_ff.B <- AIPW.B[, 12]
dr_ft_n.B <- AIPW.B[, 13]
dr_f_tp_n.B <- AIPW.B[, 14]
dr_f_to_n.B <- AIPW.B[, 15]
dr_ff_n.B <- AIPW.B[, 16]

###########
# Design C#
###########
source("Simulation1_DesignC.R")
source("RI_estimators.R")
source("AIPW_estimators.R")

N <- 500
seed <- 2027
datat <- gen.data.C(N,  seed)

estim.C <- estimators(datat)

ri_pgt.C <- estim.C[, 1]
ri_pgf.C <- estim.C[, 2]
rf_pgt.C <- estim.C[, 3]
rf_pgf.C <- estim.C[, 4]
ri_fpgt.C <- estim.C[, 5]
ri_fpgf.C <- estim.C[, 6]
rf_fpgt.C <- estim.C[, 7]
rf_fpgf.C <- estim.C[, 8]

AIPW.C <- estimators_aipw(datat)

dr_pt.C <- AIPW.C[, 1]
dr_p_tp.C <- AIPW.C[, 2]
dr_p_to.C <- AIPW.C[, 3]
dr_pf.C <- AIPW.C[, 4]
dr_pt_n.C <- AIPW.C[, 5]
dr_p_tp_n.C <- AIPW.C[, 6]
dr_p_to_n.C <- AIPW.C[, 7]
dr_pf_n.C <- AIPW.C[, 8]
dr_ft.C <- AIPW.C[, 9]
dr_f_tp.C <- AIPW.C[, 10]
dr_f_to.C <- AIPW.C[, 11]
dr_ff.C <- AIPW.C[, 12]
dr_ft_n.C <- AIPW.C[, 13]
dr_f_tp_n.C <- AIPW.C[, 14]
dr_f_to_n.C <- AIPW.C[, 15]
dr_ff_n.C <- AIPW.C[, 16]

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

AIPW.A <- round(cbind(
  mean(dr_pt.A) - 3, sd(dr_pt.A), mean((dr_pt.A - 3)^2),
  mean(dr_p_tp.A) - 3, sd(dr_p_tp.A), mean((dr_p_tp.A - 3)^2), 
  mean(dr_p_to.A) - 3, sd(dr_p_to.A), mean((dr_p_to.A - 3)^2),
  mean(dr_pf.A) - 3, sd(dr_pf.A), mean((dr_pf.A - 3)^2),
  mean(dr_pt_n.A) - 3, sd(dr_pt_n.A), mean((dr_pt_n.A - 3)^2),
  mean(dr_p_tp_n.A) - 3, sd(dr_p_tp_n.A), mean((dr_p_tp_n.A - 3)^2), 
  mean(dr_p_to_n.A) - 3, sd(dr_p_to_n.A), mean((dr_p_to_n.A - 3)^2),
  mean(dr_pf_n.A) - 3, sd(dr_pf_n.A), mean((dr_pf_n.A - 3)^2),
  mean(dr_ft.A) - 3, sd(dr_ft.A), mean((dr_ft.A - 3)^2),
  mean(dr_f_tp.A) - 3, sd(dr_f_tp.A), mean((dr_f_tp.A - 3)^2), 
  mean(dr_f_to.A) - 3, sd(dr_f_to.A), mean((dr_f_to.A - 3)^2),
  mean(dr_ff.A) - 3, sd(dr_ff.A), mean((dr_ff.A - 3)^2),
  mean(dr_ft_n.A) - 3, sd(dr_ft_n.A), mean((dr_ft_n.A - 3)^2),
  mean(dr_f_tp_n.A) - 3, sd(dr_f_tp_n.A), mean((dr_f_tp_n.A - 3)^2), 
  mean(dr_f_to_n.A) - 3, sd(dr_f_to_n.A), mean((dr_f_to_n.A - 3)^2),
  mean(dr_ff_n.A) - 3, sd(dr_ff_n.A), mean((dr_ff_n.A - 3)^2)),
  digits = 3
)

AIPW.B <- round(cbind(
  mean(dr_pt.B) - 3, sd(dr_pt.B), mean((dr_pt.B - 3)^2),
  mean(dr_p_tp.B) - 3, sd(dr_p_tp.B), mean((dr_p_tp.B - 3)^2), 
  mean(dr_p_to.B) - 3, sd(dr_p_to.B), mean((dr_p_to.B - 3)^2),
  mean(dr_pf.B) - 3, sd(dr_pf.B), mean((dr_pf.B - 3)^2),
  mean(dr_pt_n.B) - 3, sd(dr_pt_n.B), mean((dr_pt_n.B - 3)^2),
  mean(dr_p_tp_n.B) - 3, sd(dr_p_tp_n.B), mean((dr_p_tp_n.B - 3)^2), 
  mean(dr_p_to_n.B) - 3, sd(dr_p_to_n.B), mean((dr_p_to_n.B - 3)^2),
  mean(dr_pf_n.B) - 3, sd(dr_pf_n.B), mean((dr_pf_n.B - 3)^2),
  mean(dr_ft.B) - 3, sd(dr_ft.B), mean((dr_ft.B - 3)^2),
  mean(dr_f_tp.B) - 3, sd(dr_f_tp.B), mean((dr_f_tp.B - 3)^2), 
  mean(dr_f_to.B) - 3, sd(dr_f_to.B), mean((dr_f_to.B - 3)^2),
  mean(dr_ff.B) - 3, sd(dr_ff.B), mean((dr_ff.B - 3)^2),
  mean(dr_ft_n.B) - 3, sd(dr_ft_n.B), mean((dr_ft_n.B - 3)^2),
  mean(dr_f_tp_n.B) - 3, sd(dr_f_tp_n.B), mean((dr_f_tp_n.B - 3)^2), 
  mean(dr_f_to_n.B) - 3, sd(dr_f_to_n.B), mean((dr_f_to_n.B - 3)^2),
  mean(dr_ff_n.B) - 3, sd(dr_ff_n.B), mean((dr_ff_n.B - 3)^2)),
  digits = 3
)

AIPW.C <- round(cbind(
  mean(dr_pt.C) - 3, sd(dr_pt.C), mean((dr_pt.C - 3)^2),
  mean(dr_p_tp.C) - 3, sd(dr_p_tp.C), mean((dr_p_tp.C - 3)^2), 
  mean(dr_p_to.C) - 3, sd(dr_p_to.C), mean((dr_p_to.C - 3)^2),
  mean(dr_pf.C) - 3, sd(dr_pf.C), mean((dr_pf.C - 3)^2),
  mean(dr_pt_n.C) - 3, sd(dr_pt_n.C), mean((dr_pt_n.C - 3)^2),
  mean(dr_p_tp_n.C) - 3, sd(dr_p_tp_n.C), mean((dr_p_tp_n.C - 3)^2), 
  mean(dr_p_to_n.C) - 3, sd(dr_p_to_n.C), mean((dr_p_to_n.C - 3)^2),
  mean(dr_pf_n.C) - 3, sd(dr_pf_n.C), mean((dr_pf_n.C - 3)^2),
  mean(dr_ft.C) - 3, sd(dr_ft.C), mean((dr_ft.C - 3)^2),
  mean(dr_f_tp.C) - 3, sd(dr_f_tp.C), mean((dr_f_tp.C - 3)^2), 
  mean(dr_f_to.C) - 3, sd(dr_f_to.C), mean((dr_f_to.C - 3)^2),
  mean(dr_ff.C) - 3, sd(dr_ff.C), mean((dr_ff.C - 3)^2),
  mean(dr_ft_n.C) - 3, sd(dr_ft_n.C), mean((dr_ft_n.C - 3)^2),
  mean(dr_f_tp_n.C) - 3, sd(dr_f_tp_n.C), mean((dr_f_tp_n.C - 3)^2), 
  mean(dr_f_to_n.C) - 3, sd(dr_f_to_n.C), mean((dr_f_to_n.C - 3)^2),
  mean(dr_ff_n.C) - 3, sd(dr_ff_n.C), mean((dr_ff_n.C - 3)^2)),
  digits = 3
)


############################
# Run file for Simulation 1#
############################

##########
#DESIGN A#
##########

source("Simulation1_DesignA.R")
source("RI_estimators.R")
source("AIPW_estimators.R")

N <- 3000
seed <- 4001
datat <- gen.data.A(N,  seed)

estim.A3 <- estimators(datat)

ri_pgt.A3 <- estim.A3[, 1]
ri_pgf.A3 <- estim.A3[, 2]
rf_pgt.A3 <- estim.A3[, 3]
rf_pgf.A3 <- estim.A3[, 4]
ri_fpgt.A3 <- estim.A3[, 5]
ri_fpgf.A3 <- estim.A3[, 6]
rf_fpgt.A3 <- estim.A3[, 7]
rf_fpgf.A3 <- estim.A3[, 8]

AIPW.A3 <- estimators_aipw(datat)

dr_pt.A3 <- AIPW.A3[, 1]
dr_p_tp.A3 <- AIPW.A3[, 2]
dr_p_to.A3 <- AIPW.A3[, 3]
dr_pf.A3 <- AIPW.A3[, 4]
dr_pt_n.A3 <- AIPW.A3[, 5]
dr_p_tp_n.A3 <- AIPW.A3[, 6]
dr_p_to_n.A3 <- AIPW.A3[, 7]
dr_pf_n.A3 <- AIPW.A3[, 8]
dr_ft.A3 <- AIPW.A3[, 9]
dr_f_tp.A3 <- AIPW.A3[, 10]
dr_f_to.A3 <- AIPW.A3[, 11]
dr_ff.A3 <- AIPW.A3[, 12]
dr_ft_n.A3 <- AIPW.A3[, 13]
dr_f_tp_n.A3 <- AIPW.A3[, 14]
dr_f_to_n.A3 <- AIPW.A3[, 15]
dr_ff_n.A3 <- AIPW.A3[, 16]

##########
#DESIGN B#
##########
source("Simulation1_DesignB.R")
source("RI_estimators.R")
source("AIPW_estimators.R")

N <- 3000
seed <- 4002
datat <- gen.data.B(N,  seed)

estim.B3 <- estimators(datat)

ri_pgt.B3 <- estim.B3[, 1]
ri_pgf.B3 <- estim.B3[, 2]
rf_pgt.B3 <- estim.B3[, 3]
rf_pgf.B3 <- estim.B3[, 4]
ri_fpgt.B3 <- estim.B3[, 5]
ri_fpgf.B3 <- estim.B3[, 6]
rf_fpgt.B3 <- estim.B3[, 7]
rf_fpgf.B3 <- estim.B3[, 8]

AIPW.B3 <- estimators_aipw(datat)

dr_pt.B3 <- AIPW.B3[, 1]
dr_p_tp.B3 <- AIPW.B3[, 2]
dr_p_to.B3 <- AIPW.B3[, 3]
dr_pf.B3 <- AIPW.B3[, 4]
dr_pt_n.B3 <- AIPW.B3[, 5]
dr_p_tp_n.B3 <- AIPW.B3[, 6]
dr_p_to_n.B3 <- AIPW.B3[, 7]
dr_pf_n.B3 <- AIPW.B3[, 8]
dr_ft.B3 <- AIPW.B3[, 9]
dr_f_tp.B3 <- AIPW.B3[, 10]
dr_f_to.B3 <- AIPW.B3[, 11]
dr_ff.B3 <- AIPW.B3[, 12]
dr_ft_n.B3 <- AIPW.B3[, 13]
dr_f_tp_n.B3 <- AIPW.B3[, 14]
dr_f_to_n.B3 <- AIPW.B3[, 15]
dr_ff_n.B3 <- AIPW.B3[, 16]

###########
# Design C#
###########
source("Simulation1_DesignC.R")
source("RI_estimators.R")
source("AIPW_estimators.R")

N <- 3000
seed <- 4003
datat <- gen.data.C(N,  seed)

estim.C3 <- estimators(datat)

ri_pgt.C3 <- estim.C3[, 1]
ri_pgf.C3 <- estim.C3[, 2]
rf_pgt.C3 <- estim.C3[, 3]
rf_pgf.C3 <- estim.C3[, 4]
ri_fpgt.C3 <- estim.C3[, 5]
ri_fpgf.C3 <- estim.C3[, 6]
rf_fpgt.C3 <- estim.C3[, 7]
rf_fpgf.C3 <- estim.C3[, 8]

AIPW.C3 <- estimators_aipw(datat)

dr_pt.C3 <- AIPW.C3[, 1]
dr_p_tp.C3 <- AIPW.C3[, 2]
dr_p_to.C3 <- AIPW.C3[, 3]
dr_pf.C3 <- AIPW.C3[, 4]
dr_pt_n.C3 <- AIPW.C3[, 5]
dr_p_tp_n.C3 <- AIPW.C3[, 6]
dr_p_to_n.C3 <- AIPW.C3[, 7]
dr_pf_n.C3 <- AIPW.C3[, 8]
dr_ft.C3 <- AIPW.C3[, 9]
dr_f_tp.C3 <- AIPW.C3[, 10]
dr_f_to.C3 <- AIPW.C3[, 11]
dr_ff.C3 <- AIPW.C3[, 12]
dr_ft_n.C3 <- AIPW.C3[, 13]
dr_f_tp_n.C3 <- AIPW.C3[, 14]
dr_f_to_n.C3 <- AIPW.C3[, 15]
dr_ff_n.C3 <- AIPW.C3[, 16]

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

AIPW.A3 <- round(cbind(
  mean(dr_pt.A3) - 3, sd(dr_pt.A3), mean((dr_pt.A3 - 3)^2),
  mean(dr_p_tp.A3) - 3, sd(dr_p_tp.A3), mean((dr_p_tp.A3 - 3)^2), 
  mean(dr_p_to.A3) - 3, sd(dr_p_to.A3), mean((dr_p_to.A3 - 3)^2),
  mean(dr_pf.A3) - 3, sd(dr_pf.A3), mean((dr_pf.A3 - 3)^2),
  mean(dr_pt_n.A3) - 3, sd(dr_pt_n.A3), mean((dr_pt_n.A3 - 3)^2),
  mean(dr_p_tp_n.A3) - 3, sd(dr_p_tp_n.A3), mean((dr_p_tp_n.A3 - 3)^2), 
  mean(dr_p_to_n.A3) - 3, sd(dr_p_to_n.A3), mean((dr_p_to_n.A3 - 3)^2),
  mean(dr_pf_n.A3) - 3, sd(dr_pf_n.A3), mean((dr_pf_n.A3 - 3)^2),
  mean(dr_ft.A3) - 3, sd(dr_ft.A3), mean((dr_ft.A3 - 3)^2),
  mean(dr_f_tp.A3) - 3, sd(dr_f_tp.A3), mean((dr_f_tp.A3 - 3)^2), 
  mean(dr_f_to.A3) - 3, sd(dr_f_to.A3), mean((dr_f_to.A3 - 3)^2),
  mean(dr_ff.A3) - 3, sd(dr_ff.A3), mean((dr_ff.A3 - 3)^2),
  mean(dr_ft_n.A3) - 3, sd(dr_ft_n.A3), mean((dr_ft_n.A3 - 3)^2),
  mean(dr_f_tp_n.A3) - 3, sd(dr_f_tp_n.A3), mean((dr_f_tp_n.A3 - 3)^2), 
  mean(dr_f_to_n.A3) - 3, sd(dr_f_to_n.A3), mean((dr_f_to_n.A3 - 3)^2),
  mean(dr_ff_n.A3) - 3, sd(dr_ff_n.A3), mean((dr_ff_n.A3 - 3)^2)),
  digits = 3
)

AIPW.B3 <- round(cbind(
  mean(dr_pt.B3) - 3, sd(dr_pt.B3), mean((dr_pt.B3 - 3)^2),
  mean(dr_p_tp.B3) - 3, sd(dr_p_tp.B3), mean((dr_p_tp.B3 - 3)^2), 
  mean(dr_p_to.B3) - 3, sd(dr_p_to.B3), mean((dr_p_to.B3 - 3)^2),
  mean(dr_pf.B3) - 3, sd(dr_pf.B3), mean((dr_pf.B3 - 3)^2),
  mean(dr_pt_n.B3) - 3, sd(dr_pt_n.B3), mean((dr_pt_n.B3 - 3)^2),
  mean(dr_p_tp_n.B3) - 3, sd(dr_p_tp_n.B3), mean((dr_p_tp_n.B3 - 3)^2), 
  mean(dr_p_to_n.B3) - 3, sd(dr_p_to_n.B3), mean((dr_p_to_n.B3 - 3)^2),
  mean(dr_pf_n.B3) - 3, sd(dr_pf_n.B3), mean((dr_pf_n.B3 - 3)^2),
  mean(dr_ft.B3) - 3, sd(dr_ft.B3), mean((dr_ft.B3 - 3)^2),
  mean(dr_f_tp.B3) - 3, sd(dr_f_tp.B3), mean((dr_f_tp.B3 - 3)^2), 
  mean(dr_f_to.B3) - 3, sd(dr_f_to.B3), mean((dr_f_to.B3 - 3)^2),
  mean(dr_ff.B3) - 3, sd(dr_ff.B3), mean((dr_ff.B3 - 3)^2),
  mean(dr_ft_n.B3) - 3, sd(dr_ft_n.B3), mean((dr_ft_n.B3 - 3)^2),
  mean(dr_f_tp_n.B3) - 3, sd(dr_f_tp_n.B3), mean((dr_f_tp_n.B3 - 3)^2), 
  mean(dr_f_to_n.B3) - 3, sd(dr_f_to_n.B3), mean((dr_f_to_n.B3 - 3)^2),
  mean(dr_ff_n.B3) - 3, sd(dr_ff_n.B3), mean((dr_ff_n.B3 - 3)^2)),
  digits = 3
)


AIPW.C3 <- round(cbind(
  mean(dr_pt.C3) - 3, sd(dr_pt.C3), mean((dr_pt.C3 - 3)^2),
  mean(dr_p_tp.C3) - 3, sd(dr_p_tp.C3), mean((dr_p_tp.C3 - 3)^2), 
  mean(dr_p_to.C3) - 3, sd(dr_p_to.C3), mean((dr_p_to.C3 - 3)^2),
  mean(dr_pf.C3) - 3, sd(dr_pf.C3), mean((dr_pf.C3 - 3)^2),
  mean(dr_pt_n.C3) - 3, sd(dr_pt_n.C3), mean((dr_pt_n.C3 - 3)^2),
  mean(dr_p_tp_n.C3) - 3, sd(dr_p_tp_n.C3), mean((dr_p_tp_n.C3 - 3)^2), 
  mean(dr_p_to_n.C3) - 3, sd(dr_p_to_n.C3), mean((dr_p_to_n.C3 - 3)^2),
  mean(dr_pf_n.C3) - 3, sd(dr_pf_n.C3), mean((dr_pf_n.C3 - 3)^2),
  mean(dr_ft.C3) - 3, sd(dr_ft.C3), mean((dr_ft.C3 - 3)^2),
  mean(dr_f_tp.C3) - 3, sd(dr_f_tp.C3), mean((dr_f_tp.C3 - 3)^2), 
  mean(dr_f_to.C3) - 3, sd(dr_f_to.C3), mean((dr_f_to.C3 - 3)^2),
  mean(dr_ff.C3) - 3, sd(dr_ff.C3), mean((dr_ff.C3 - 3)^2),
  mean(dr_ft_n.C3) - 3, sd(dr_ft_n.C3), mean((dr_ft_n.C3 - 3)^2),
  mean(dr_f_tp_n.C3) - 3, sd(dr_f_tp_n.C3), mean((dr_f_tp_n.C3 - 3)^2), 
  mean(dr_f_to_n.C3) - 3, sd(dr_f_to_n.C3), mean((dr_f_to_n.C3 - 3)^2),
  mean(dr_ff_n.C3) - 3, sd(dr_ff_n.C3), mean((dr_ff_n.C3 - 3)^2)),
  digits = 3
)


############################
# Run file for Simulation 1#
############################

##########
#DESIGN A#
##########

source("Simulation1_DesignA.R")
source("RI_estimators.R")
source("AIPW_estimators.R")

N <- 1000
seed <- 3001
datat <- gen.data.A(N,  seed)

estim.A2 <- estimators(datat)

ri_pgt.A2 <- estim.A2[, 1]
ri_pgf.A2 <- estim.A2[, 2]
rf_pgt.A2 <- estim.A2[, 3]
rf_pgf.A2 <- estim.A2[, 4]
ri_fpgt.A2 <- estim.A2[, 5]
ri_fpgf.A2 <- estim.A2[, 6]
rf_fpgt.A2 <- estim.A2[, 7]
rf_fpgf.A2 <- estim.A2[, 8]

AIPW.A2 <- estimators_aipw(datat)

dr_pt.A2 <- AIPW.A2[, 1]
dr_p_tp.A2 <- AIPW.A2[, 2]
dr_p_to.A2 <- AIPW.A2[, 3]
dr_pf.A2 <- AIPW.A2[, 4]
dr_pt_n.A2 <- AIPW.A2[, 5]
dr_p_tp_n.A2 <- AIPW.A2[, 6]
dr_p_to_n.A2 <- AIPW.A2[, 7]
dr_pf_n.A2 <- AIPW.A2[, 8]
dr_ft.A2 <- AIPW.A2[, 9]
dr_f_tp.A2 <- AIPW.A2[, 10]
dr_f_to.A2 <- AIPW.A2[, 11]
dr_ff.A2 <- AIPW.A2[, 12]
dr_ft_n.A2 <- AIPW.A2[, 13]
dr_f_tp_n.A2 <- AIPW.A2[, 14]
dr_f_to_n.A2 <- AIPW.A2[, 15]
dr_ff_n.A2 <- AIPW.A2[, 16]

##########
#DESIGN B#
##########
source("Simulation1_DesignB.R")
source("RI_estimators.R")
source("AIPW_estimators.R")

N <- 1000
seed <- 3002
datat <- gen.data.B(N,  seed)

estim.B2 <- estimators(datat)

ri_pgt.B2 <- estim.B2[, 1]
ri_pgf.B2 <- estim.B2[, 2]
rf_pgt.B2 <- estim.B2[, 3]
rf_pgf.B2 <- estim.B2[, 4]
ri_fpgt.B2 <- estim.B2[, 5]
ri_fpgf.B2 <- estim.B2[, 6]
rf_fpgt.B2 <- estim.B2[, 7]
rf_fpgf.B2 <- estim.B2[, 8]

AIPW.B2 <- estimators_aipw(datat)

dr_pt.B2 <- AIPW.B2[, 1]
dr_p_tp.B2 <- AIPW.B2[, 2]
dr_p_to.B2 <- AIPW.B2[, 3]
dr_pf.B2 <- AIPW.B2[, 4]
dr_pt_n.B2 <- AIPW.B2[, 5]
dr_p_tp_n.B2 <- AIPW.B2[, 6]
dr_p_to_n.B2 <- AIPW.B2[, 7]
dr_pf_n.B2 <- AIPW.B2[, 8]
dr_ft.B2 <- AIPW.B2[, 9]
dr_f_tp.B2 <- AIPW.B2[, 10]
dr_f_to.B2 <- AIPW.B2[, 11]
dr_ff.B2 <- AIPW.B2[, 12]
dr_ft_n.B2 <- AIPW.B2[, 13]
dr_f_tp_n.B2 <- AIPW.B2[, 14]
dr_f_to_n.B2 <- AIPW.B2[, 15]
dr_ff_n.B2 <- AIPW.B2[, 16]

###########
# Design C#
###########
source("Simulation1_DesignC.R")
source("RI_estimators.R")
source("AIPW_estimators.R")

N <- 1000
seed <- 3003
datat <- gen.data.C(N,  seed)

estim.C2 <- estimators(datat)

ri_pgt.C2 <- estim.C2[, 1]
ri_pgf.C2 <- estim.C2[, 2]
rf_pgt.C2 <- estim.C2[, 3]
rf_pgf.C2 <- estim.C2[, 4]
ri_fpgt.C2 <- estim.C2[, 5]
ri_fpgf.C2 <- estim.C2[, 6]
rf_fpgt.C2 <- estim.C2[, 7]
rf_fpgf.C2 <- estim.C2[, 8]

AIPW.C2 <- estimators_aipw(datat)

dr_pt.C2 <- AIPW.C2[, 1]
dr_p_tp.C2 <- AIPW.C2[, 2]
dr_p_to.C2 <- AIPW.C2[, 3]
dr_pf.C2 <- AIPW.C2[, 4]
dr_pt_n.C2 <- AIPW.C2[, 5]
dr_p_tp_n.C2 <- AIPW.C2[, 6]
dr_p_to_n.C2 <- AIPW.C2[, 7]
dr_pf_n.C2 <- AIPW.C2[, 8]
dr_ft.C2 <- AIPW.C2[, 9]
dr_f_tp.C2 <- AIPW.C2[, 10]
dr_f_to.C2 <- AIPW.C2[, 11]
dr_ff.C2 <- AIPW.C2[, 12]
dr_ft_n.C2 <- AIPW.C2[, 13]
dr_f_tp_n.C2 <- AIPW.C2[, 14]
dr_f_to_n.C2 <- AIPW.C2[, 15]
dr_ff_n.C2 <- AIPW.C2[, 16]

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

AIPW.A2 <- round(cbind(
  mean(dr_pt.A2) - 3, sd(dr_pt.A2), mean((dr_pt.A2 - 3)^2),
  mean(dr_p_tp.A2) - 3, sd(dr_p_tp.A2), mean((dr_p_tp.A2 - 3)^2), 
  mean(dr_p_to.A2) - 3, sd(dr_p_to.A2), mean((dr_p_to.A2 - 3)^2),
  mean(dr_pf.A2) - 3, sd(dr_pf.A2), mean((dr_pf.A2 - 3)^2),
  mean(dr_pt_n.A2) - 3, sd(dr_pt_n.A2), mean((dr_pt_n.A2 - 3)^2),
  mean(dr_p_tp_n.A2) - 3, sd(dr_p_tp_n.A2), mean((dr_p_tp_n.A2 - 3)^2), 
  mean(dr_p_to_n.A2) - 3, sd(dr_p_to_n.A2), mean((dr_p_to_n.A2 - 3)^2),
  mean(dr_pf_n.A2) - 3, sd(dr_pf_n.A2), mean((dr_pf_n.A2 - 3)^2),
  mean(dr_ft.A2) - 3, sd(dr_ft.A2), mean((dr_ft.A2 - 3)^2),
  mean(dr_f_tp.A2) - 3, sd(dr_f_tp.A2), mean((dr_f_tp.A2 - 3)^2), 
  mean(dr_f_to.A2) - 3, sd(dr_f_to.A2), mean((dr_f_to.A2 - 3)^2),
  mean(dr_ff.A2) - 3, sd(dr_ff.A2), mean((dr_ff.A2 - 3)^2),
  mean(dr_ft_n.A2) - 3, sd(dr_ft_n.A2), mean((dr_ft_n.A2 - 3)^2),
  mean(dr_f_tp_n.A2) - 3, sd(dr_f_tp_n.A2), mean((dr_f_tp_n.A2 - 3)^2), 
  mean(dr_f_to_n.A2) - 3, sd(dr_f_to_n.A2), mean((dr_f_to_n.A2 - 3)^2),
  mean(dr_ff_n.A2) - 3, sd(dr_ff_n.A2), mean((dr_ff_n.A2 - 3)^2)),
  digits = 3
)

AIPW.B2 <- round(cbind(
  mean(dr_pt.B2) - 3, sd(dr_pt.B2), mean((dr_pt.B2 - 3)^2),
  mean(dr_p_tp.B2) - 3, sd(dr_p_tp.B2), mean((dr_p_tp.B2 - 3)^2), 
  mean(dr_p_to.B2) - 3, sd(dr_p_to.B2), mean((dr_p_to.B2 - 3)^2),
  mean(dr_pf.B2) - 3, sd(dr_pf.B2), mean((dr_pf.B2 - 3)^2),
  mean(dr_pt_n.B2) - 3, sd(dr_pt_n.B2), mean((dr_pt_n.B2 - 3)^2),
  mean(dr_p_tp_n.B2) - 3, sd(dr_p_tp_n.B2), mean((dr_p_tp_n.B2 - 3)^2), 
  mean(dr_p_to_n.B2) - 3, sd(dr_p_to_n.B2), mean((dr_p_to_n.B2 - 3)^2),
  mean(dr_pf_n.B2) - 3, sd(dr_pf_n.B2), mean((dr_pf_n.B2 - 3)^2),
  mean(dr_ft.B2) - 3, sd(dr_ft.B2), mean((dr_ft.B2 - 3)^2),
  mean(dr_f_tp.B2) - 3, sd(dr_f_tp.B2), mean((dr_f_tp.B2 - 3)^2), 
  mean(dr_f_to.B2) - 3, sd(dr_f_to.B2), mean((dr_f_to.B2 - 3)^2),
  mean(dr_ff.B2) - 3, sd(dr_ff.B2), mean((dr_ff.B2 - 3)^2),
  mean(dr_ft_n.B2) - 3, sd(dr_ft_n.B2), mean((dr_ft_n.B2 - 3)^2),
  mean(dr_f_tp_n.B2) - 3, sd(dr_f_tp_n.B2), mean((dr_f_tp_n.B2 - 3)^2), 
  mean(dr_f_to_n.B2) - 3, sd(dr_f_to_n.B2), mean((dr_f_to_n.B2 - 3)^2),
  mean(dr_ff_n.B2) - 3, sd(dr_ff_n.B2), mean((dr_ff_n.B2 - 3)^2)),
  digits = 3
)


AIPW.C2 <- round(cbind(
  mean(dr_pt.C2) - 3, sd(dr_pt.C2), mean((dr_pt.C2 - 3)^2),
  mean(dr_p_tp.C2) - 3, sd(dr_p_tp.C2), mean((dr_p_tp.C2 - 3)^2), 
  mean(dr_p_to.C2) - 3, sd(dr_p_to.C2), mean((dr_p_to.C2 - 3)^2),
  mean(dr_pf.C2) - 3, sd(dr_pf.C2), mean((dr_pf.C2 - 3)^2),
  mean(dr_pt_n.C2) - 3, sd(dr_pt_n.C2), mean((dr_pt_n.C2 - 3)^2),
  mean(dr_p_tp_n.C2) - 3, sd(dr_p_tp_n.C2), mean((dr_p_tp_n.C2 - 3)^2), 
  mean(dr_p_to_n.C2) - 3, sd(dr_p_to_n.C2), mean((dr_p_to_n.C2 - 3)^2),
  mean(dr_pf_n.C2) - 3, sd(dr_pf_n.C2), mean((dr_pf_n.C2 - 3)^2),
  mean(dr_ft.C2) - 3, sd(dr_ft.C2), mean((dr_ft.C2 - 3)^2),
  mean(dr_f_tp.C2) - 3, sd(dr_f_tp.C2), mean((dr_f_tp.C2 - 3)^2), 
  mean(dr_f_to.C2) - 3, sd(dr_f_to.C2), mean((dr_f_to.C2 - 3)^2),
  mean(dr_ff.C2) - 3, sd(dr_ff.C2), mean((dr_ff.C2 - 3)^2),
  mean(dr_ft_n.C2) - 3, sd(dr_ft_n.C2), mean((dr_ft_n.C2 - 3)^2),
  mean(dr_f_tp_n.C2) - 3, sd(dr_f_tp_n.C2), mean((dr_f_tp_n.C2 - 3)^2), 
  mean(dr_f_to_n.C2) - 3, sd(dr_f_to_n.C2), mean((dr_f_to_n.C2 - 3)^2),
  mean(dr_ff_n.C2) - 3, sd(dr_ff_n.C2), mean((dr_ff_n.C2 - 3)^2)),
  digits = 3
)


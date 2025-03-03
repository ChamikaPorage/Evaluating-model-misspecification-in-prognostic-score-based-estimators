############################
# Run file for Simulation 2#
############################

##########
#DESIGN A#
##########

source("Simulation2_DesignA.R")
source("RI_estimators.R")
source("AIPW_estimators.R")

N <- 1000
seed <- 3101
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

AIPW.A2_s2 <- estimators_aipw(datat)

dr_pt.A2_s2 <- AIPW.A2_s2[, 1]
dr_p_tp.A2_s2 <- AIPW.A2_s2[, 2]
dr_p_to.A2_s2 <- AIPW.A2_s2[, 3]
dr_pf.A2_s2 <- AIPW.A2_s2[, 4]
dr_pt_n.A2_s2 <- AIPW.A2_s2[, 5]
dr_p_tp_n.A2_s2 <- AIPW.A2_s2[, 6]
dr_p_to_n.A2_s2 <- AIPW.A2_s2[, 7]
dr_pf_n.A2_s2 <- AIPW.A2_s2[, 8]
dr_ft.A2_s2 <- AIPW.A2_s2[, 9]
dr_f_tp.A2_s2 <- AIPW.A2_s2[, 10]
dr_f_to.A2_s2 <- AIPW.A2_s2[, 11]
dr_ff.A2_s2 <- AIPW.A2_s2[, 12]
dr_ft_n.A2_s2 <- AIPW.A2_s2[, 13]
dr_f_tp_n.A2_s2 <- AIPW.A2_s2[, 14]
dr_f_to_n.A2_s2 <- AIPW.A2_s2[, 15]
dr_ff_n.A2_s2 <- AIPW.A2_s2[, 16]

##########
#DESIGN B#
##########
source("Simulation2_DesignB_cf.R")
source("RI_estimators_cf.R")
source("AIPW_estimators.R")

N <- 1000
seed <- 3102
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

AIPW.B2_s2 <- estimators_aipw(datat)

dr_pt.B2_s2 <- AIPW.B2_s2[, 1]
dr_p_tp.B2_s2 <- AIPW.B2_s2[, 2]
dr_p_to.B2_s2 <- AIPW.B2_s2[, 3]
dr_pf.B2_s2 <- AIPW.B2_s2[, 4]
dr_pt_n.B2_s2 <- AIPW.B2_s2[, 5]
dr_p_tp_n.B2_s2 <- AIPW.B2_s2[, 6]
dr_p_to_n.B2_s2 <- AIPW.B2_s2[, 7]
dr_pf_n.B2_s2 <- AIPW.B2_s2[, 8]
dr_ft.B2_s2 <- AIPW.B2_s2[, 9]
dr_f_tp.B2_s2 <- AIPW.B2_s2[, 10]
dr_f_to.B2_s2 <- AIPW.B2_s2[, 11]
dr_ff.B2_s2 <- AIPW.B2_s2[, 12]
dr_ft_n.B2_s2 <- AIPW.B2_s2[, 13]
dr_f_tp_n.B2_s2 <- AIPW.B2_s2[, 14]
dr_f_to_n.B2_s2 <- AIPW.B2_s2[, 15]
dr_ff_n.B2_s2 <- AIPW.B2_s2[, 16]

###########
# Design C#
###########
source("Simulation2_DesignC.R")
source("RI_estimators.R")
source("AIPW_estimators.R")

N <- 1000
seed <- 3103
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

AIPW.C2_s2 <- estimators_aipw(datat)

dr_pt.C2_s2 <- AIPW.C2_s2[, 1]
dr_p_tp.C2_s2 <- AIPW.C2_s2[, 2]
dr_p_to.C2_s2 <- AIPW.C2_s2[, 3]
dr_pf.C2_s2 <- AIPW.C2_s2[, 4]
dr_pt_n.C2_s2 <- AIPW.C2_s2[, 5]
dr_p_tp_n.C2_s2 <- AIPW.C2_s2[, 6]
dr_p_to_n.C2_s2 <- AIPW.C2_s2[, 7]
dr_pf_n.C2_s2 <- AIPW.C2_s2[, 8]
dr_ft.C2_s2 <- AIPW.C2_s2[, 9]
dr_f_tp.C2_s2 <- AIPW.C2_s2[, 10]
dr_f_to.C2_s2 <- AIPW.C2_s2[, 11]
dr_ff.C2_s2 <- AIPW.C2_s2[, 12]
dr_ft_n.C2_s2 <- AIPW.C2_s2[, 13]
dr_f_tp_n.C2_s2 <- AIPW.C2_s2[, 14]
dr_f_to_n.C2_s2 <- AIPW.C2_s2[, 15]
dr_ff_n.C2_s2 <- AIPW.C2_s2[, 16]

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

AIPW.A2_s2 <- round(cbind(
  mean(dr_pt.A2_s2) - 3.7, sd(dr_pt.A2_s2), mean((dr_pt.A2_s2 - 3.7)^2),
  mean(dr_p_tp.A2_s2) - 3.7, sd(dr_p_tp.A2_s2), mean((dr_p_tp.A2_s2 - 3.7)^2), 
  mean(dr_p_to.A2_s2) - 3.7, sd(dr_p_to.A2_s2), mean((dr_p_to.A2_s2 - 3.7)^2),
  mean(dr_pf.A2_s2) - 3.7, sd(dr_pf.A2_s2), mean((dr_pf.A2_s2 - 3.7)^2),
  mean(dr_pt_n.A2_s2) - 3.7, sd(dr_pt_n.A2_s2), mean((dr_pt_n.A2_s2 - 3.7)^2),
  mean(dr_p_tp_n.A2_s2) - 3.7, sd(dr_p_tp_n.A2_s2), mean((dr_p_tp_n.A2_s2 - 3.7)^2), 
  mean(dr_p_to_n.A2_s2) - 3.7, sd(dr_p_to_n.A2_s2), mean((dr_p_to_n.A2_s2 - 3.7)^2),
  mean(dr_pf_n.A2_s2) - 3.7, sd(dr_pf_n.A2_s2), mean((dr_pf_n.A2_s2 - 3.7)^2),
  mean(dr_ft.A2_s2) - 3.7, sd(dr_ft_n.A2_s2), mean((dr_ft_n.A2_s2 - 3.7)^2),
  mean(dr_f_tp.A2_s2) - 3.7, sd(dr_f_tp_n.A2_s2), mean((dr_f_tp_n.A2_s2 - 3.7)^2), 
  mean(dr_f_to.A2_s2) - 3.7, sd(dr_f_to_n.A2_s2), mean((dr_f_to_n.A2_s2 - 3.7)^2),
  mean(dr_ff.A2_s2) - 3.7, sd(dr_ff_n.A2_s2), mean((dr_ff_n.A2_s2 - 3.7)^2),
  mean(dr_ft_n.A2_s2) - 3.7, sd(dr_ft_n.A2_s2), mean((dr_ft_n.A2_s2 - 3.7)^2),
  mean(dr_f_tp_n.A2_s2) - 3.7, sd(dr_f_tp_n.A2_s2), mean((dr_f_tp_n.A2_s2 - 3.7)^2), 
  mean(dr_f_to_n.A2_s2) - 3.7, sd(dr_f_to_n.A2_s2), mean((dr_f_to_n.A2_s2 - 3.7)^2),
  mean(dr_ff_n.A2_s2) - 3.7, sd(dr_ff_n.A2_s2), mean((dr_ff_n.A2_s2 - 3.7)^2)),
  digits = 3
)


AIPW.B2_s2 <- round(cbind(
  mean(dr_pt.B2_s2) - 3.7, sd(dr_pt.B2_s2), mean((dr_pt.B2_s2 - 3.7)^2),
  mean(dr_p_tp.B2_s2) - 3.7, sd(dr_p_tp.B2_s2), mean((dr_p_tp.B2_s2 - 3.7)^2), 
  mean(dr_p_to.B2_s2) - 3.7, sd(dr_p_to.B2_s2), mean((dr_p_to.B2_s2 - 3.7)^2),
  mean(dr_pf.B2_s2) - 3.7, sd(dr_pf.B2_s2), mean((dr_pf.B2_s2 - 3.7)^2),
  mean(dr_pt_n.B2_s2) - 3.7, sd(dr_pt_n.B2_s2), mean((dr_pt_n.B2_s2 - 3.7)^2),
  mean(dr_p_tp_n.B2_s2) - 3.7, sd(dr_p_tp_n.B2_s2), mean((dr_p_tp_n.B2_s2 - 3.7)^2), 
  mean(dr_p_to_n.B2_s2) - 3.7, sd(dr_p_to_n.B2_s2), mean((dr_p_to_n.B2_s2 - 3.7)^2),
  mean(dr_pf_n.B2_s2) - 3.7, sd(dr_pf_n.B2_s2), mean((dr_pf_n.B2_s2 - 3.7)^2),
  mean(dr_ft.B2_s2) - 3.7, sd(dr_ft_n.B2_s2), mean((dr_ft_n.B2_s2 - 3.7)^2),
  mean(dr_f_tp.B2_s2) - 3.7, sd(dr_f_tp_n.B2_s2), mean((dr_f_tp_n.B2_s2 - 3.7)^2), 
  mean(dr_f_to.B2_s2) - 3.7, sd(dr_f_to_n.B2_s2), mean((dr_f_to_n.B2_s2 - 3.7)^2),
  mean(dr_ff.B2_s2) - 3.7, sd(dr_ff_n.B2_s2), mean((dr_ff_n.B2_s2 - 3.7)^2),
  mean(dr_ft_n.B2_s2) - 3.7, sd(dr_ft_n.B2_s2), mean((dr_ft_n.B2_s2 - 3.7)^2),
  mean(dr_f_tp_n.B2_s2) - 3.7, sd(dr_f_tp_n.B2_s2), mean((dr_f_tp_n.B2_s2 - 3.7)^2), 
  mean(dr_f_to_n.B2_s2) - 3.7, sd(dr_f_to_n.B2_s2), mean((dr_f_to_n.B2_s2 - 3.7)^2),
  mean(dr_ff_n.B2_s2) - 3.7, sd(dr_ff_n.B2_s2), mean((dr_ff_n.B2_s2 - 3.7)^2)),
  digits = 3
)

AIPW.C2_s2 <- round(cbind(
  mean(dr_pt.C2_s2) - 3.7, sd(dr_pt.C2_s2), mean((dr_pt.C2_s2 - 3.7)^2),
  mean(dr_p_tp.C2_s2) - 3.7, sd(dr_p_tp.C2_s2), mean((dr_p_tp.C2_s2 - 3.7)^2), 
  mean(dr_p_to.C2_s2) - 3.7, sd(dr_p_to.C2_s2), mean((dr_p_to.C2_s2 - 3.7)^2),
  mean(dr_pf.C2_s2) - 3.7, sd(dr_pf.C2_s2), mean((dr_pf.C2_s2 - 3.7)^2),
  mean(dr_pt_n.C2_s2) - 3.7, sd(dr_pt_n.C2_s2), mean((dr_pt_n.C2_s2 - 3.7)^2),
  mean(dr_p_tp_n.C2_s2) - 3.7, sd(dr_p_tp_n.C2_s2), mean((dr_p_tp_n.C2_s2 - 3.7)^2), 
  mean(dr_p_to_n.C2_s2) - 3.7, sd(dr_p_to_n.C2_s2), mean((dr_p_to_n.C2_s2 - 3.7)^2),
  mean(dr_pf_n.C2_s2) - 3.7, sd(dr_pf_n.C2_s2), mean((dr_pf_n.C2_s2 - 3.7)^2),
  mean(dr_ft.C2_s2) - 3.7, sd(dr_ft_n.C2_s2), mean((dr_ft_n.C2_s2 - 3.7)^2),
  mean(dr_f_tp.C2_s2) - 3.7, sd(dr_f_tp_n.C2_s2), mean((dr_f_tp_n.C2_s2 - 3.7)^2), 
  mean(dr_f_to.C2_s2) - 3.7, sd(dr_f_to_n.C2_s2), mean((dr_f_to_n.C2_s2 - 3.7)^2),
  mean(dr_ff.C2_s2) - 3.7, sd(dr_ff_n.C2_s2), mean((dr_ff_n.C2_s2 - 3.7)^2),
  mean(dr_ft_n.C2_s2) - 3.7, sd(dr_ft_n.C2_s2), mean((dr_ft_n.C2_s2 - 3.7)^2),
  mean(dr_f_tp_n.C2_s2) - 3.7, sd(dr_f_tp_n.C2_s2), mean((dr_f_tp_n.C2_s2 - 3.7)^2), 
  mean(dr_f_to_n.C2_s2) - 3.7, sd(dr_f_to_n.C2_s2), mean((dr_f_to_n.C2_s2 - 3.7)^2),
  mean(dr_ff_n.C2_s2) - 3.7, sd(dr_ff_n.C2_s2), mean((dr_ff_n.C2_s2 - 3.7)^2)),
  digits = 3
)


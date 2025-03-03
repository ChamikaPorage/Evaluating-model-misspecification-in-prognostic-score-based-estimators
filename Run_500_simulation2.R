############################
# Run file for Simulation 2#
############################


##########
#DESIGN A#
##########

source("Simulation2_DesignA.R")
source("RI_estimators.R")
source("AIPW_estimators.R")

N <- 500
seed <- 2101
datat <- gen.data.A2(N,  seed)

estim.A_s2 <- estimators(datat)

ri_pgt.A_s2 <- estim.A_s2[, 1]
ri_pgf.A_s2 <- estim.A_s2[, 2]
rf_pgt.A_s2 <- estim.A_s2[, 3]
rf_pgf.A_s2 <- estim.A_s2[, 4]
ri_fpgt.A_s2 <- estim.A_s2[, 5]
ri_fpgf.A_s2 <- estim.A_s2[, 6]
rf_fpgt.A_s2 <- estim.A_s2[, 7]
rf_fpgf.A_s2 <- estim.A_s2[, 8]

AIPW.A_s2 <- estimators_aipw(datat)

dr_pt.A_s2 <- AIPW.A_s2[, 1]
dr_p_tp.A_s2 <- AIPW.A_s2[, 2]
dr_p_to.A_s2 <- AIPW.A_s2[, 3]
dr_pf.A_s2 <- AIPW.A_s2[, 4]
dr_pt_n.A_s2 <- AIPW.A_s2[, 5]
dr_p_tp_n.A_s2 <- AIPW.A_s2[, 6]
dr_p_to_n.A_s2 <- AIPW.A_s2[, 7]
dr_pf_n.A_s2 <- AIPW.A_s2[, 8]
dr_ft.A_s2 <- AIPW.A_s2[, 9]
dr_f_tp.A_s2 <- AIPW.A_s2[, 10]
dr_f_to.A_s2 <- AIPW.A_s2[, 11]
dr_ff.A_s2 <- AIPW.A_s2[, 12]
dr_ft_n.A_s2 <- AIPW.A_s2[, 13]
dr_f_tp_n.A_s2 <- AIPW.A_s2[, 14]
dr_f_to_n.A_s2 <- AIPW.A_s2[, 15]
dr_ff_n.A_s2 <- AIPW.A_s2[, 16]

##########
#DESIGN B#
##########
source("Simulation2_DesignB.R")
source("RI_estimators.R")
source("AIPW_estimators.R")

N <- 500
seed <- 2102
datat <- gen.data.B2(N,  seed)

estim.B_s2 <- estimators(datat)

ri_pgt.B_s2 <- estim.B_s2[, 1]
ri_pgf.B_s2 <- estim.B_s2[, 2]
rf_pgt.B_s2 <- estim.B_s2[, 3]
rf_pgf.B_s2 <- estim.B_s2[, 4]
ri_fpgt.B_s2 <- estim.B_s2[, 5]
ri_fpgf.B_s2 <- estim.B_s2[, 6]
rf_fpgt.B_s2 <- estim.B_s2[, 7]
rf_fpgf.B_s2 <- estim.B_s2[, 8]

AIPW.B_s2 <- estimators_aipw(datat)

dr_pt.B_s2 <- AIPW.B_s2[, 1]
dr_p_tp.B_s2 <- AIPW.B_s2[, 2]
dr_p_to.B_s2 <- AIPW.B_s2[, 3]
dr_pf.B_s2 <- AIPW.B_s2[, 4]
dr_pt_n.B_s2 <- AIPW.B_s2[, 5]
dr_p_tp_n.B_s2 <- AIPW.B_s2[, 6]
dr_p_to_n.B_s2 <- AIPW.B_s2[, 7]
dr_pf_n.B_s2 <- AIPW.B_s2[, 8]
dr_ft.B_s2 <- AIPW.B_s2[, 9]
dr_f_tp.B_s2 <- AIPW.B_s2[, 10]
dr_f_to.B_s2 <- AIPW.B_s2[, 11]
dr_ff.B_s2 <- AIPW.B_s2[, 12]
dr_ft_n.B_s2 <- AIPW.B_s2[, 13]
dr_f_tp_n.B_s2 <- AIPW.B_s2[, 14]
dr_f_to_n.B_s2 <- AIPW.B_s2[, 15]
dr_ff_n.B_s2 <- AIPW.B_s2[, 16]


###########
# Design C#
###########
source("Simulation2_DesignC.R")
source("RI_estimators_cf.R")
source("AIPW_estimators.R")

N <- 500
seed <- 2103
datat <- gen.data.C2(N,  seed)

estim.C_s2 <- estimators(datat)

ri_pgt.C_s2 <- estim.C_s2[, 1]
ri_pgf.C_s2 <- estim.C_s2[, 2]
rf_pgt.C_s2 <- estim.C_s2[, 3]
rf_pgf.C_s2 <- estim.C_s2[, 4]
ri_fpgt.C_s2 <- estim.C_s2[, 5]
ri_fpgf.C_s2 <- estim.C_s2[, 6]
rf_fpgt.C_s2 <- estim.C_s2[, 7]
rf_fpgf.C_s2 <- estim.C_s2[, 8]

AIPW.C_s2 <- estimators_aipw(datat)

dr_pt.C_s2 <- AIPW.C_s2[, 1]
dr_p_tp.C_s2 <- AIPW.C_s2[, 2]
dr_p_to.C_s2 <- AIPW.C_s2[, 3]
dr_pf.C_s2 <- AIPW.C_s2[, 4]
dr_pt_n.C_s2 <- AIPW.C_s2[, 5]
dr_p_tp_n.C_s2 <- AIPW.C_s2[, 6]
dr_p_to_n.C_s2 <- AIPW.C_s2[, 7]
dr_pf_n.C_s2 <- AIPW.C_s2[, 8]
dr_ft.C_s2 <- AIPW.C_s2[, 9]
dr_f_tp.C_s2 <- AIPW.C_s2[, 10]
dr_f_to.C_s2 <- AIPW.C_s2[, 11]
dr_ff.C_s2 <- AIPW.C_s2[, 12]
dr_ft_n.C_s2 <- AIPW.C_s2[, 13]
dr_f_tp_n.C_s2 <- AIPW.C_s2[, 14]
dr_f_to_n.C_s2 <- AIPW.C_s2[, 15]
dr_ff_n.C_s2 <- AIPW.C_s2[, 16]


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

AIPW.A_s2 <- round(cbind(
  mean(dr_pt.A_s2) - 3.7, sd(dr_pt.A_s2), mean((dr_pt.A_s2 - 3.7)^2),
  mean(dr_p_tp.A_s2) - 3.7, sd(dr_p_tp.A_s2), mean((dr_p_tp.A_s2 - 3.7)^2), 
  mean(dr_p_to.A_s2) - 3.7, sd(dr_p_to.A_s2), mean((dr_p_to.A_s2 - 3.7)^2),
  mean(dr_pf.A_s2) - 3.7, sd(dr_pf.A_s2), mean((dr_pf.A_s2 - 3.7)^2),
  mean(dr_pt_n.A_s2) - 3.7, sd(dr_pt_n.A_s2), mean((dr_pt_n.A_s2 - 3.7)^2),
  mean(dr_p_tp_n.A_s2) - 3.7, sd(dr_p_tp_n.A_s2), mean((dr_p_tp_n.A_s2 - 3.7)^2), 
  mean(dr_p_to_n.A_s2) - 3.7, sd(dr_p_to_n.A_s2), mean((dr_p_to_n.A_s2 - 3.7)^2),
  mean(dr_pf_n.A_s2) - 3.7, sd(dr_pf_n.A_s2), mean((dr_pf_n.A_s2 - 3.7)^2),
  mean(dr_ft.A_s2) - 3.7, sd(dr_ft_n.A_s2), mean((dr_ft_n.A_s2 - 3.7)^2),
  mean(dr_f_tp.A_s2) - 3.7, sd(dr_f_tp_n.A_s2), mean((dr_f_tp_n.A_s2 - 3.7)^2), 
  mean(dr_f_to.A_s2) - 3.7, sd(dr_f_to_n.A_s2), mean((dr_f_to_n.A_s2 - 3.7)^2),
  mean(dr_ff.A_s2) - 3.7, sd(dr_ff_n.A_s2), mean((dr_ff_n.A_s2 - 3.7)^2),
  mean(dr_ft_n.A_s2) - 3.7, sd(dr_ft_n.A_s2), mean((dr_ft_n.A_s2 - 3.7)^2),
  mean(dr_f_tp_n.A_s2) - 3.7, sd(dr_f_tp_n.A_s2), mean((dr_f_tp_n.A_s2 - 3.7)^2), 
  mean(dr_f_to_n.A_s2) - 3.7, sd(dr_f_to_n.A_s2), mean((dr_f_to_n.A_s2 - 3.7)^2),
  mean(dr_ff_n.A_s2) - 3.7, sd(dr_ff_n.A_s2), mean((dr_ff_n.A_s2 - 3.7)^2)),
  digits = 3
)


AIPW.B_s2 <- round(cbind(
  mean(dr_pt.B_s2) - 3.7, sd(dr_pt.B_s2), mean((dr_pt.B_s2 - 3.7)^2),
  mean(dr_p_tp.B_s2) - 3.7, sd(dr_p_tp.B_s2), mean((dr_p_tp.B_s2 - 3.7)^2), 
  mean(dr_p_to.B_s2) - 3.7, sd(dr_p_to.B_s2), mean((dr_p_to.B_s2 - 3.7)^2),
  mean(dr_pf.B_s2) - 3.7, sd(dr_pf.B_s2), mean((dr_pf.B_s2 - 3.7)^2),
  mean(dr_pt_n.B_s2) - 3.7, sd(dr_pt_n.B_s2), mean((dr_pt_n.B_s2 - 3.7)^2),
  mean(dr_p_tp_n.B_s2) - 3.7, sd(dr_p_tp_n.B_s2), mean((dr_p_tp_n.B_s2 - 3.7)^2), 
  mean(dr_p_to_n.B_s2) - 3.7, sd(dr_p_to_n.B_s2), mean((dr_p_to_n.B_s2 - 3.7)^2),
  mean(dr_pf_n.B_s2) - 3.7, sd(dr_pf_n.B_s2), mean((dr_pf_n.B_s2 - 3.7)^2),
  mean(dr_ft.B_s2) - 3.7, sd(dr_ft_n.B_s2), mean((dr_ft_n.B_s2 - 3.7)^2),
  mean(dr_f_tp.B_s2) - 3.7, sd(dr_f_tp_n.B_s2), mean((dr_f_tp_n.B_s2 - 3.7)^2), 
  mean(dr_f_to.B_s2) - 3.7, sd(dr_f_to_n.B_s2), mean((dr_f_to_n.B_s2 - 3.7)^2),
  mean(dr_ff.B_s2) - 3.7, sd(dr_ff_n.B_s2), mean((dr_ff_n.B_s2 - 3.7)^2),
  mean(dr_ft_n.B_s2) - 3.7, sd(dr_ft_n.B_s2), mean((dr_ft_n.B_s2 - 3.7)^2),
  mean(dr_f_tp_n.B_s2) - 3.7, sd(dr_f_tp_n.B_s2), mean((dr_f_tp_n.B_s2 - 3.7)^2), 
  mean(dr_f_to_n.B_s2) - 3.7, sd(dr_f_to_n.B_s2), mean((dr_f_to_n.B_s2 - 3.7)^2),
  mean(dr_ff_n.B_s2) - 3.7, sd(dr_ff_n.B_s2), mean((dr_ff_n.B_s2 - 3.7)^2)),
  digits = 3
)

AIPW.C_s2 <- round(cbind(
  mean(dr_pt.C_s2) - 3.7, sd(dr_pt.C_s2), mean((dr_pt.C_s2 - 3.7)^2),
  mean(dr_p_tp.C_s2) - 3.7, sd(dr_p_tp.C_s2), mean((dr_p_tp.C_s2 - 3.7)^2), 
  mean(dr_p_to.C_s2) - 3.7, sd(dr_p_to.C_s2), mean((dr_p_to.C_s2 - 3.7)^2),
  mean(dr_pf.C_s2) - 3.7, sd(dr_pf.C_s2), mean((dr_pf.C_s2 - 3.7)^2),
  mean(dr_pt_n.C_s2) - 3.7, sd(dr_pt_n.C_s2), mean((dr_pt_n.C_s2 - 3.7)^2),
  mean(dr_p_tp_n.C_s2) - 3.7, sd(dr_p_tp_n.C_s2), mean((dr_p_tp_n.C_s2 - 3.7)^2), 
  mean(dr_p_to_n.C_s2) - 3.7, sd(dr_p_to_n.C_s2), mean((dr_p_to_n.C_s2 - 3.7)^2),
  mean(dr_pf_n.C_s2) - 3.7, sd(dr_pf_n.C_s2), mean((dr_pf_n.C_s2 - 3.7)^2),
  mean(dr_ft.C_s2) - 3.7, sd(dr_ft_n.C_s2), mean((dr_ft_n.C_s2 - 3.7)^2),
  mean(dr_f_tp.C_s2) - 3.7, sd(dr_f_tp_n.C_s2), mean((dr_f_tp_n.C_s2 - 3.7)^2), 
  mean(dr_f_to.C_s2) - 3.7, sd(dr_f_to_n.C_s2), mean((dr_f_to_n.C_s2 - 3.7)^2),
  mean(dr_ff.C_s2) - 3.7, sd(dr_ff_n.C_s2), mean((dr_ff_n.C_s2 - 3.7)^2),
  mean(dr_ft_n.C_s2) - 3.7, sd(dr_ft_n.C_s2), mean((dr_ft_n.C_s2 - 3.7)^2),
  mean(dr_f_tp_n.C_s2) - 3.7, sd(dr_f_tp_n.C_s2), mean((dr_f_tp_n.C_s2 - 3.7)^2), 
  mean(dr_f_to_n.C_s2) - 3.7, sd(dr_f_to_n.C_s2), mean((dr_f_to_n.C_s2 - 3.7)^2),
  mean(dr_ff_n.C_s2) - 3.7, sd(dr_ff_n.C_s2), mean((dr_ff_n.C_s2 - 3.7)^2)),
  digits = 3
)

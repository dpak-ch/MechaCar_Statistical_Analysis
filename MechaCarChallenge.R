library(dplyr)

# --------------------- Deliverable 1 -----------------------------------

mpg_df <- read.csv('MechaCar_mpg.csv',check.names = F,stringsAsFactors = F) #import MechaCar dataset
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mpg_df)
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mpg_df))

# --------------------- Deliverable 2 -----------------------------------


suscoil_df <- read.csv('Suspension_Coil.csv',check.names = F,stringsAsFactors = F) #import Suspension coil dataset
total_summary <- summarize(suscoil_df,Mean = mean(PSI), Median = median(PSI),Variance = var(PSI), SD = sd(PSI))

lot_summary <- suscoil_df %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI), 
                                                                Median = median(PSI),
                                                                Variance = var(PSI), SD = sd(PSI))

# --------------------- Deliverable 3 -----------------------------------
t.test(suscoil_df$PSI,mu=1500) #compare sample versus population means

t.test(subset(suscoil_df, Manufacturing_Lot == 'Lot1', select = PSI),mu=1500)
t.test(subset(suscoil_df, Manufacturing_Lot == 'Lot2', select = PSI),mu=1500)
t.test(subset(suscoil_df, Manufacturing_Lot == 'Lot3', select = PSI),mu=1500)

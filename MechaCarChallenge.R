## DELIVERALBE 1

# Loading dplyr library
library(dplyr)

# Reading in the "MechaCar_mpg.csv" file, creating a dataframe
mechaCar_Mpg_Df <- read.csv('MechaCar_mpg.csv',stringsAsFactors = F)


# Performing linear regression
lm(mpg ~ vehicle_weight + vehicle_length + spoiler_angle + ground_clearance + AWD, data=mechaCar_Mpg_Df)

# Summarizing our linear regression results
summary(lm(mpg ~ vehicle_weight + vehicle_length + spoiler_angle + ground_clearance + AWD, data=mechaCar_Mpg_Df))


## DELIVERABLE 2

# Reading in the "Suspension_Coil.csv" file
suspension_df <- read.csv('Suspension_Coil.csv', stringsAsFactors = F)


# Creating a summary table of the suspension data
suspension_summary <- suspension_df %>% summarize(Mean_PSI=mean(PSI),
                                                  Median_PSI=median(PSI),
                                                  Var_PSI=var(PSI),
                                                  Std_Dev_PSI=sd(PSI),
                                                  Num_Coil=n(), .groups = 'keep')


# Creating a summary table of suspension data based on lot number
lot_sumamry <- suspension_df  %>% group_by(Manufacturing_Lot) %>% summarize(
  Mean_PSI=mean(PSI),
  Median_PSI=median(PSI),
  Var_PSI=var(PSI),
  Std_Dev_PSI=sd(PSI),
  Num_Coil=n(), .groups = 'keep')


## DELIVERABLE 3
# using the t-test to determine if the PSI of all manufacturing lots are #statistically different from the population mean of 1,500 pounds per #square inch.
t.test(suspension_df$PSI,mu=1500)


# using the t.test to determine if the PSI of EACH manufacturing lot is
#statistically different from the population mean of 1,500 pounds per #square inch.

#Assigning lot subsets
lot1 <- subset(suspension_df, Manufacturing_Lot=="Lot1")
lot2 <- subset(suspension_df, Manufacturing_Lot=="Lot2")
lot3 <- subset(suspension_df, Manufacturing_Lot=="Lot3")

# Running t.test of each subset(lot)
t.test(lot1$PSI,mu=1500)
t.test(lot2$PSI,mu=1500)
t.test(lot3$PSI,mu=1500)

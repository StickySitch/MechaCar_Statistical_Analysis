# Overview 
AutosRUs' has  a new prototype called `MechaCar`. MechaCar is suffering from production troubles that are blocking the manufacturing team’s progress. In order to find our issue, we will be diving deep into MechaCars dataset provided by the `MechaCar_mpg.csv` and `Suspension_Coil.csv`  files. 

## Resources
- `Software:` [R Studio](https://www.rstudio.com/) **|** [R](https://www.r-project.org/)
- `Data Sources:` [MechaCar_mpg.csv](https://github.com/StickySitch/MechaCar_Statistical_Analysis/blob/main/MechaCar_mpg.csv) **|** [Suspension_Coil.csv](https://github.com/StickySitch/MechaCar_Statistical_Analysis/blob/main/Suspension_Coil.csv)
- `Libraries:` [dplyr](https://www.rdocumentation.org/packages/dplyr/versions/0.7.8)
- `Source Code:` [MechaCarChallenge.RScript](https://github.com/StickySitch/MechaCar_Statistical_Analysis/blob/main/MechaCarChallenge.RScript) **|** [MechaCarChallenge.R](https://github.com/StickySitch/MechaCar_Statistical_Analysis/blob/main/MechaCarChallenge.R)

## Linear Regression to Predict MPG
The `MechaCar_mpg.csv` dataset contains mpg(miles per gallon) test results for 50 prototype MechaCars. To decide the ideal vehicle for performance and efficiency, these prototypes consist on different production specifications. 

Our `MechaCar_mpg.csv` holds data for the following metrics:  Vehicle length, vehicle weight, spoiler angle, ground clearance, and drivetrain (AWD?). In order to decide what prototype metrics are producing positive outcomes for the mpg, we have created a linear model summarizing the data and providing us with the values necessary to either **reject our null hypothesis** (Not random chance) or **fail reject our null hypothesis** (Random chance).

### Linear Regression Resulting Model:

![Linear model](https://github.com/StickySitch/MechaCar_Statistical_Analysis/blob/main/Images/LinearRegSummary.png)

#### Data Statistical Summary:

Above you can see the results from our linear regression model. With these results, we can see the following:

1. When looking at our summary output, we can deduce the following:
   * **Vehicle Length:** With a value of `2.60e-12`, our p-value is significantly smaller than our assumed significance level of 0.05%. Knowing this, we can **reject our null hypothesis**; Indicating that our linear models slope is **not** zero. In other words, `Vehicle length` is likely to contribute to the efficiency of the vehicle(mpg) and is not due to random chance.
   * **Vehicle ground clearance:** With a value of `5.21e-08`, our p-value is significantly smaller than our assumed significance level of 0.05%. Knowing this, we can **reject our null hypothesis**; Indicating that our linear models slope is **not** zero. In other words, `Vehicle ground clearance` is likely to contribute to the efficiency of the vehicle(mpg) and is not due to random chance.
   * When it comes to our **Vehicle weight**, **Spoiler angle**, and **Drivetrain** (AWD) variables; We **FAIL to reject our null hypothesis**. In other words, our p-value is **larger** than our **assumed significance level** of 0.05%; indicating a random amount of variance. Keep in mind, this doesn't necessarily mean they don't effect our mpg. It could possibly mean there isn't sufficient evidence to conclude that the effect exists.

2. **Model P-value:** `5.35e-11`
	* As seen in the bottom of the image above, the p-value for our  model is: `5.35e-11`. With our assumed significance level of `0.05%`, our p-value is significantly smaller! With such a small p-value, we have sufficient evidence to **reject our null hypothesis**, again indicating that the slope of this linear model in **not zero**.
	* 
3. **R-Squared Value:** `0.7149`
	* Our R-Squared value is essentially the accuracy of our model and its predictions. With our R-squared value being `0.7149` we can determine that approximately **71%** of all **predictions will be accurately determined**. This means that our multiple regression model **can predict** the mpg of MechaCar prototypes **relatively effectively**.

## Summary Statistics on Suspension Coils

In order to determine if the manufacturing process is consistent across each production lot, we have inspected our `Suspension_Coil.csv` dataset to see if the manufacturing lots are keeping their variance of the suspension coils **below** 100 pounds per square inch (psi). In other words, the `Var_PSI` columns value must **not** exceed 100psi.
#### Suspension  Summary: All Lots

![Suspension Summary](https://github.com/StickySitch/MechaCar_Statistical_Analysis/blob/main/Images/suspensionSummary.png)

##### Does the current manufacturing data meet this design specifications?
Above is a summary of **all** manufacturing lots MechaCar suspension coil data.
- The design specification dictate that the variance of the suspension coils must not exceed 100 pounds per square inch. With this is mind, we can take a look at our `Var_PSI` column and see a value of `62.29356`; Significantly lower than the allowed variance maximum. Let's dive a little deeper into each manufacturing lot to find out their level of psi variance.

#### Suspension  Summary: Lots 1, 2 & 3
![Lot Summary](https://github.com/StickySitch/MechaCar_Statistical_Analysis/blob/main/Images/lotsummary.png)

Once again, we are checking to see that the variance of the suspension coils does **not** exceed 100 pounds per square inch; But this time, we are looking at each manufacturing lot.
- **`Manufacturing Lot 1`**
	- **Lot 1** has a variance value of `0.9795918`psi; Well below the design specification maximum of 100psi. **Lot 1** is **not** the issue.
- **`Manufacturing Lot 2`**
	- **Lot 2** has a variance value of `7.4693878`psi; Although lot 2 has a higher variance than lot 1, the psi variance is still well below the design specification maximum of 100psi. **Lot 2** is **not** the issue.
- **`Manufacturing Lot 3`**
	- **Lot 3** has a variance value of `170.2861224`psi. Unlike Lot 1 and Lot 2; Lot 3 **does** exceed the allowed PSI variance level that was specified by the design specifications. With this data we we can conclude that **Lot 3 is the issue** with production due to their inconsistent production standards. 
	- **Another point of note:** Although the summary of all lots shows a psi variance of `62.29356`, well below the design specifications; If Lot 3 improves its production standards to meet the design specifications, the level of variance for all lots would go down significantly!

## T-Tests on Suspension Coils
![T-Test All Data](https://github.com/StickySitch/MechaCar_Statistical_Analysis/blob/main/Images/oneSampleAll.png)

#### T-test All Lots
Above you can see the t-test results of **all manufacturing lots**. 

At the bottom of our output we can see the **mean psi** of `1498.78`; This was also displayed in our overall lot summary above. With a **p-value** of `0.06028`, we must **fail to reject our null hypothesis** due to the fact that our **p-value is greater** than our **assumed significance level** of `0.05%`. There is insufficient evidence to show that all lots are responsible for the psi issues. In other words, with this data presented, there is no clear reason for the production issues.

Just like earlier, let's see what we can find when we dig a little deeper.

#### T-test for lot 1
![T-Test Lot1](https://github.com/StickySitch/MechaCar_Statistical_Analysis/blob/main/Images/oneSampleLot1.png)

**Lot 1** is right on point! These guys know their job and are doing it well! The psi mean of lot 1 is exactly where it needs to be; As displayed by the **mean** of `1500`, which is right on the dot per the design specifications. Also, the **p-value** of `1` indicates that we must **fail to reject our null hypothesis** due to the fact that our **p-value is greater** than our **assumed significance level** of `0.05%`. There is **insufficient evidence** to show that **lot 1** is responsible for the psi standards issues.

#### T-test for lot 2
![T-Test Lot2](https://github.com/StickySitch/MechaCar_Statistical_Analysis/blob/main/Images/oneSampleLot2.png)

**Lot 2** is also full of superstars! They aren't number one on the chart like lot 1, but they are a close second! **Lot 2** has a **mean psi** of `1500.2`; Just about the design specifications ideal psi of `1500`. Just like lot 1, we must **fail to reject our null hypothesis** due to the fact that our **p-value is greater** than our **assumed significance level** of `0.05%`.  The **p-value** of lot 2 is `0.6072`. With this information we know that there **insufficient evidence** to show that **lot 2** is responsible for the psi standards issues.

#### T-test for lot 3
![T-Test Lot3](https://github.com/StickySitch/MechaCar_Statistical_Analysis/blob/main/Images/oneSampleLot3.png) 

**Lot 3** as you may have guessed from the summary data earlier is going to be a different story; So let's get into it. 
**Lot 3**, as mentioned earlier in the summary information, has the issue causing the production inconsistencies. Further solidifying this is the `t-test` results presented above for lot 3. The **mean psi** of **Lot 3** is `1496.14`. On top of this, the **p-value** is `0.04168`, indicating that we must **reject our null hypothesis**  due to the fact that our **p-value is less** than our **assumed significance level** of `0.05%`. In other words, we must assume our alternative hypothesis: `The true mean is not equal to 1500`. Again, in other words, **Lot 3** is not up to production standards and needs to be evaluated to decide what the next course of action would be in order to fix production.

## Study Design: MechaCar vs Competition

In order to decide if **MechaCar** will be **on par with its competitors safety wise**, we can compare MechaCars  `safety rating` to the competitor cars with similar specifications(MPG, Drivetrain, Selling price, etc...). Let's take a look at the metrics we will use for this analysis.
- **Metrics**
	- **Safety Rating:** `Dependent variable`
	- **Average Yearly Cost of Ownership:** `Independent variable`
	- **0-60 Time (How fast does the car go from 0mph-60mph):** `Independent variable`
	- **Selling Price:** `Independent variable`
	- **Engine Type (Electric, Hybrid, Gasoline):** `Independent variable`
	- **Drivetrain (AWD?):** `Independent variable`
	- **MPG (Miles Per Gallon):** `Independent variable`

- **Hypothesis**
	- **Null Hypothesis (Ho):**
		- MechaCar **is** on par with its competitors in terms of safety ratings based on its performance of key factors for its genre.
	- **Alternative Hypothesis (Ha):**
		- MechaCar **is not** on par with its competitors in terms of safety ratings based on its performance of key factors for its genre.

- **Statistical Test**
	- A **multiple linear regression** would be used to determine the factors that have the highest correlation/predictability with the safety rating (dependent variable); which combination has the greatest impact on safety rating. With this, MechaCar can decide what features are worth what safety rating. In other words, in order to compete, will they need to sacrifice some off the line speed (0-60mph) to increase their safety rating? Multiple linear regression would help us get the information we need! 

#Reading Data from file
#Data of wing lengths of houseflies
library(readr)
library(flextable)
wings_houseflies <- read_csv("wings houseflies",col_names = FALSE)
View(wings_houseflies)

wings <- wings_houseflies$X1;

#Simulating generated sample of housefly of wing lengths of sample size = 5
x <- replicate(7, sample(wings, 5, replace = TRUE))

#Generating data frame from above samples
data <- data.frame(x)
colnames(data) <- c("Fly A","Fly B","Fly C","Fly D","Fly E","Fly F","Fly G")
rownames(data) <- c("WingLength 1", "WingLength 2", "WingLength 3", "WingLength 4", "WingLength 5")


#Fitting of data model into the equation
grand_total <- sum(data$`Fly A`)+sum(data$`Fly B`)+ sum(data$`Fly C`)+ sum(data$`Fly D`)+sum(data$`Fly E`)+sum(data$`Fly F`)+sum(data$`Fly G`)
SS <- sum((data$`Fly A`)*(data$`Fly A`))+sum((data$`Fly B`)*(data$`Fly B`))+sum((data$`Fly C`)*(data$`Fly C`))+sum((data$`Fly D`)*(data$`Fly D`))+sum((data$`Fly E`)*(data$`Fly E`))+sum((data$`Fly F`)*(data$`Fly F`))+sum((data$`Fly G`)*(data$`Fly G`))
SSN <- ((sum(data$`Fly A`)*(sum(data$`Fly A`)))+(sum(data$`Fly B`)*(sum(data$`Fly B`)))+(sum(data$`Fly C`)*(sum(data$`Fly C`)))+ (sum(data$`Fly D`)*(sum(data$`Fly D`)))+(sum(data$`Fly E`)*(sum(data$`Fly E`)))+(sum(data$`Fly F`)*(sum(data$`Fly F`)))+(sum(data$`Fly G`)*(sum(data$`Fly G`))))/5

CT <- ((grand_total)*(grand_total))/35

SS_total <- SS - CT

df <- 6 #7 samples of length 5
SS_groups <- SSN - CT
SS_within <- SS_total - SS_groups

MS_groups <- SS_groups/df
MS_within <- SS_within/(df*7)

F_observed <- MS_groups/MS_within

d1 <- data.frame(x = c(" - ","Among groups","Within groups","Total"))
colnames(d1) <- "Source of Variation"
d2 <- data.frame(x = c(" - ","6","35","41"))
colnames(d2) <- "df"
d3 <- data.frame(x = c(" - ",SS_groups,SS_within,sum(SS_groups,SS_within)))
colnames(d3) <- "SS"
d4 <- data.frame(x = c(" - ",MS_groups,MS_within," "))
colnames(d4) <- "MS"
d5 <- data.frame(x = c(F_observed," - "," - "," - "))
colnames(d5) <- "F"

anova_t <- cbind(d1,d2,d3,d4,d5)
t <- data.table::as.data.table(anova_t, keep.rownames = TRUE)

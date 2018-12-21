#Submitted By Pawan

#The following libraries must be present in environment for the code to execute
library(readr)
library(flextable)
library(officer)
library(shiny)
titanic_dat <- read_table2("titanic_dat.txt",col_names = FALSE)
cols <- c("Economic Status", "Age", "Sex", "Survived")
colnames(titanic_dat) <- cols
titanic_dat$`Economic Status`[titanic_dat$`Economic Status` == 0] <- "Crew"
titanic_dat$`Economic Status`[titanic_dat$`Economic Status` == 1] <- "first"
titanic_dat$`Economic Status`[titanic_dat$`Economic Status` == 2] <- "second"
titanic_dat$`Economic Status`[titanic_dat$`Economic Status` == 3] <- "third"
titanic_dat$Age[titanic_dat$Age == 1] <- "Adult"
titanic_dat$Age[titanic_dat$Age == 0] <- "Child"
titanic_dat$Sex[titanic_dat$Sex == 1] <- "Male"
titanic_dat$Sex[titanic_dat$Sex == 0] <- "Female"
titanic_dat$Survived[titanic_dat$Survived == 1] <- "Yes"
titanic_dat$Survived[titanic_dat$Survived == 0] <- "No"


#By Economic Status and Sex
#First sub column for number of population exposed to risk
count_male_risk_first <- length(which(titanic_dat$`Economic Status` == "first" & titanic_dat$Sex == "Male"))
count_female_risk_first <- length(which(titanic_dat$`Economic Status` == "first" & titanic_dat$Sex == "Female"))

count_both_risk_first = count_female_risk_first + count_male_risk_first
count_male_risk_second = length(which(titanic_dat$`Economic Status` == "second" & titanic_dat$Sex == "Male"))

count_female_risk_second = length(which(titanic_dat$`Economic Status` == "second" & titanic_dat$Sex == "Female"))
count_both_risk_second = count_female_risk_second + count_male_risk_second
count_male_risk_third =  length(which(titanic_dat$`Economic Status` == "third" & titanic_dat$Sex == "Male"))
count_female_risk_third = length(which(titanic_dat$`Economic Status` == "third" & titanic_dat$Sex == "Female"))
count_both_risk_third = count_female_risk_third + count_male_risk_third
count_male_risk_crew = length(which(titanic_dat$`Economic Status` == "crew" & titanic_dat$Sex == "Male"))
count_male_risk_crew = length(which(titanic_dat$`Economic Status` == "Crew" & titanic_dat$Sex == "Male"))
count_female_risk_crew = length(which(titanic_dat$`Economic Status` == "Crew" & titanic_dat$Sex == "Female"))
count_both_risk_crew = count_female_risk_crew + count_male_risk_crew

#Second sub column for number of deaths 
count_deaths_male_first = length(which(titanic_dat$`Survived` == "No" & titanic_dat$Sex == "Male"))
count_deaths_male_first = length(which(titanic_dat$`Survived` == "No" & titanic_dat$Sex == "Male" & titanic_dat$`Economic Status`== "first"))
count_deaths_female_first = length(which(titanic_dat$`Survived` == "No" & titanic_dat$Sex == "Female" & titanic_dat$`Economic Status`== "first"))
count_deaths_both_first = count_deaths_female_first + count_deaths_male_first

count_deaths_male_second = length(which(titanic_dat$`Survived` == "No" & titanic_dat$Sex == "Male" & titanic_dat$`Economic Status`== "second"))

count_deaths_female_second = length(which(titanic_dat$`Survived` == "No" & titanic_dat$Sex == "Female" & titanic_dat$`Economic Status`== "second"))

count_deaths_both_second = count_deaths_female_second + count_deaths_male_second
count_deaths_male_third = length(which(titanic_dat$`Survived` == "No" & titanic_dat$Sex == "Male" & titanic_dat$`Economic Status`== "third"))
count_deaths_female_third = length(which(titanic_dat$`Survived` == "No" & titanic_dat$Sex == "Female" & titanic_dat$`Economic Status`== "third"))
count_female_risk_first <- length(which(titanic_dat$`Economic Status` == "first" & titanic_dat$Sex == "Female"))
count_both_risk_first = count_female_risk_first + count_male_risk_first
count_male_risk_second = length(which(titanic_dat$`Economic Status` == "second" & titanic_dat$Sex == "Male"))
count_female_risk_second = length(which(titanic_dat$`Economic Status` == "second" & titanic_dat$Sex == "Female"))
count_both_risk_second = count_female_risk_second + count_male_risk_second
count_male_risk_third =  length(which(titanic_dat$`Economic Status` == "third" & titanic_dat$Sex == "Male"))
count_female_risk_third = length(which(titanic_dat$`Economic Status` == "third" & titanic_dat$Sex == "Female"))
count_both_risk_third = count_female_risk_third + count_male_risk_third
count_male_risk_crew = length(which(titanic_dat$`Economic Status` == "Crew" & titanic_dat$Sex == "Male"))
count_female_risk_crew = length(which(titanic_dat$`Economic Status` == "Crew" & titanic_dat$Sex == "Female"))
count_both_risk_crew = count_female_risk_crew + count_male_risk_crew

#Second sub column for number of deaths 
count_deaths_male_first = length(which(titanic_dat$`Survived` == "No" & titanic_dat$Sex == "Male"))
count_deaths_male_first = length(which(titanic_dat$`Survived` == "No" & titanic_dat$Sex == "Male" & titanic_dat$`Economic Status`== "first"))
count_deaths_female_first = length(which(titanic_dat$`Survived` == "No" & titanic_dat$Sex == "Female" & titanic_dat$`Economic Status`== "first"))
count_deaths_both_first = count_deaths_female_first + count_deaths_male_first
count_deaths_male_second = length(which(titanic_dat$`Survived` == "No" & titanic_dat$Sex == "Male" & titanic_dat$`Economic Status`== "second"))
count_deaths_female_second = length(which(titanic_dat$`Survived` == "No" & titanic_dat$Sex == "Female" & titanic_dat$`Economic Status`== "second"))
count_deaths_both_second = count_deaths_female_second + count_deaths_male_second
count_deaths_male_third = length(which(titanic_dat$`Survived` == "No" & titanic_dat$Sex == "Male" & titanic_dat$`Economic Status`== "third"))
count_deaths_female_third = length(which(titanic_dat$`Survived` == "No" & titanic_dat$Sex == "Female" & titanic_dat$`Economic Status`== "third"))
count_deaths_both_third = count_deaths_female_third + count_deaths_male_third
count_deaths_male_crew = length(which(titanic_dat$`Survived` == "No" & titanic_dat$Sex == "Male" & titanic_dat$`Economic Status`== "Crew"))
count_deaths_female_crew = length(which(titanic_dat$`Survived` == "No" & titanic_dat$Sex == "Female" & titanic_dat$`Economic Status`== "Crew"))
count_deaths_both_crew = count_deaths_female_crew + count_deaths_male_crew

#Third sub column number of deaths per 100
count_dph_male_risk_first = floor((count_deaths_male_first/count_male_risk_first)*100)
count_dph_female_risk_first = round((count_deaths_female_first/count_female_risk_first)*100)
count_dph_both_first = floor((count_deaths_both_first/count_both_risk_first)*100)
count_dph_male_risk_second = ceiling((count_deaths_male_second/count_male_risk_second)*100)
count_dph_female_risk_second = floor((count_deaths_female_second/count_female_risk_second)*100)
count_dph_both_risk_second = ceiling((count_deaths_both_second/count_both_risk_second)*100)
count_dph_male_risk_third = ceiling((count_deaths_male_third/count_male_risk_third)*100)
count_dph_female_risk_third = floor((count_deaths_female_third/count_female_risk_third)*100)
count_dph_both_risk_third = floor((count_deaths_both_third/count_both_risk_third)*100)
count_dph_male_risk_crew = ceiling((count_deaths_male_crew/count_male_risk_crew)*100)
count_dph_female_risk_crew = floor((count_deaths_female_crew/count_female_risk_crew)*100)
count_dph_both_risk_crew = floor((count_deaths_both_crew/count_both_risk_crew)*100)
#Calculating total of all values in a column
total_male_risk = count_male_risk_first + count_male_risk_second + count_male_risk_third + count_male_risk_crew
total_female_risk = count_female_risk_first + count_female_risk_second + count_female_risk_third + count_female_risk_crew
total_both_risk = count_both_risk_first + count_both_risk_second + count_both_risk_third + count_both_risk_crew
total_male_deaths = count_deaths_male_first + count_deaths_male_second + count_deaths_male_third + count_deaths_male_crew
total_female_deaths = count_deaths_female_first + count_deaths_female_second + count_deaths_female_third + count_deaths_female_crew
total_both_deaths = count_deaths_both_first + count_deaths_both_second + count_deaths_both_third + count_deaths_both_crew
total_dph_male = ceiling((total_male_deaths/total_male_risk)*100)
total_dph_female = ceiling((total_female_deaths/total_female_risk)*100)
total_dph_both = floor((total_both_deaths/total_both_risk)*100)

#creating data frame for population exposed to risk
pop_data_risk <- data.frame(Economic_Status = c("I","II","III","Other","Total"),Male_risk = c(count_male_risk_first,count_male_risk_second,count_male_risk_third,count_male_risk_crew,total_male_risk),Female_risk = c(count_female_risk_first,count_female_risk_second,count_female_risk_third,count_female_risk_crew,total_female_risk),Both_risk = c(count_both_risk_first,count_both_risk_second,count_both_risk_third,count_both_risk_crew,total_both_risk),stringsAsFactors = FALSE)

#Creating data frame for number of deaths
pop_data_death <- data.frame(Male_deaths = c(count_deaths_male_first,count_deaths_male_second,count_deaths_male_third,count_deaths_male_crew,total_male_deaths),Female_deaths = c(count_deaths_female_first,count_deaths_female_second,count_deaths_female_third,count_deaths_female_crew,total_female_deaths),Both_deaths = c(count_deaths_both_first,count_deaths_both_second,count_deaths_both_third,count_deaths_both_crew,total_both_deaths),stringsAsFactors = FALSE)

#Creating data frame for Deaths per 100
pop_data_dph <- data.frame(Male_dph = c(count_dph_male_risk_first,count_dph_male_risk_second,count_dph_male_risk_third,count_dph_male_risk_crew,total_dph_male),Female_dph = c(count_dph_female_risk_first,count_dph_female_risk_second,count_dph_female_risk_third,count_dph_female_risk_crew,total_dph_female),Both_dph = c(count_dph_both_first,count_dph_both_risk_second,count_dph_both_risk_third,count_dph_both_risk_crew,total_dph_both),stringsAsFactors = FALSE)
#Table1
table1 <- cbind.data.frame(pop_data_risk,pop_data_death,pop_data_dph)

#Table 2
#By Economic Status and Age
count_Adult_risk_first <- length(which(titanic_dat$`Economic Status` == "first" & titanic_dat$Age == "Adult"))
count_Child_risk_first <- length(which(titanic_dat$`Economic Status` == "first" & titanic_dat$Age == "Child"))
count_Both_risk_first = count_Adult_risk_first + count_Child_risk_first

count_Adult_risk_second = length(which(titanic_dat$`Economic Status` == "second" & titanic_dat$Age == "Adult"))
count_Child_risk_second = length(which(titanic_dat$`Economic Status` == "second" & titanic_dat$Age == "Child"))
count_Both_risk_second = count_Adult_risk_second + count_Child_risk_second

count_Adult_risk_third =  length(which(titanic_dat$`Economic Status` == "third" & titanic_dat$Age == "Adult"))
count_Child_risk_third = length(which(titanic_dat$`Economic Status` == "third" & titanic_dat$Age == "Child"))
count_Both_risk_third = count_Adult_risk_third + count_Child_risk_third

count_Adult_risk_crew = length(which(titanic_dat$`Economic Status` == "Crew" & titanic_dat$Age == "Adult"))
count_Child_risk_crew = length(which(titanic_dat$`Economic Status` == "Crew" & titanic_dat$Age == "Child"))
count_Both_risk_crew = count_Adult_risk_crew + count_Child_risk_crew



count_deaths_Adult_first = length(which(titanic_dat$`Survived` == "No" & titanic_dat$Age == "Adult" & titanic_dat$`Economic Status`== "first"))
count_deaths_Child_first = length(which(titanic_dat$`Survived` == "No" & titanic_dat$Age == "Child" & titanic_dat$`Economic Status`== "first"))
count_deaths_Both_first = count_deaths_Adult_first + count_deaths_Child_first

count_deaths_Adult_second = length(which(titanic_dat$`Survived` == "No" & titanic_dat$Age == "Adult" & titanic_dat$`Economic Status`== "second"))
count_deaths_Child_second = length(which(titanic_dat$`Survived` == "No" & titanic_dat$Age == "Child" & titanic_dat$`Economic Status`== "second"))
count_deaths_Both_second = count_deaths_Adult_second + count_deaths_Child_second

count_deaths_Adult_third = length(which(titanic_dat$`Survived` == "No" & titanic_dat$Age == "Adult" & titanic_dat$`Economic Status`== "third"))
count_deaths_Child_third = length(which(titanic_dat$`Survived` == "No" & titanic_dat$Age == "Child" & titanic_dat$`Economic Status`== "third"))
count_deaths_Both_third = count_deaths_Adult_third + count_deaths_Child_third

count_deaths_Adult_crew = length(which(titanic_dat$`Survived` == "No" & titanic_dat$Age == "Adult" & titanic_dat$`Economic Status`== "Crew"))
count_deaths_Child_crew = length(which(titanic_dat$`Survived` == "No" & titanic_dat$Age == "Child" & titanic_dat$`Economic Status`== "Crew"))
count_deaths_Both_crew = count_deaths_Adult_crew + count_deaths_Child_crew

count_dph_Adult_risk_first = floor((count_deaths_Adult_first/count_Adult_risk_first)*100)
count_dph_Child_risk_first = round((count_deaths_Child_first/count_Child_risk_first)*100)
count_dph_Both_first = floor((count_deaths_Both_first/count_Both_risk_first)*100)

count_dph_Adult_risk_second = ceiling((count_deaths_Adult_second/count_Adult_risk_second)*100)
count_dph_Child_risk_second = floor((count_deaths_Child_second/count_Child_risk_second)*100)
count_dph_Both_risk_second = ceiling((count_deaths_Both_second/count_Both_risk_second)*100)

count_dph_Adult_risk_third = ceiling((count_deaths_Adult_third/count_Adult_risk_third)*100)
count_dph_Child_risk_third = ceiling((count_deaths_Child_third/count_Child_risk_third)*100)
count_dph_Both_risk_third = floor((count_deaths_Both_third/count_Both_risk_third)*100)

count_dph_Adult_risk_crew = floor((count_deaths_Adult_crew/count_Adult_risk_crew)*100)
count_dph_Child_risk_crew = round((count_deaths_Child_crew/count_Child_risk_crew)*100)
count_dph_Both_risk_crew = floor((count_deaths_Both_crew/count_Both_risk_crew)*100)

total_Adult_risk = count_Adult_risk_first + count_Adult_risk_second + count_Adult_risk_third + count_Adult_risk_crew
total_Child_risk = count_Child_risk_first + count_Child_risk_second + count_Child_risk_third + count_Child_risk_crew
total_Both_risk = count_Both_risk_first + count_Both_risk_second + count_Both_risk_third + count_Both_risk_crew
total_Adult_deaths = count_deaths_Adult_first + count_deaths_Adult_second + count_deaths_Adult_third + count_deaths_Adult_crew
total_Child_deaths = count_deaths_Child_first + count_deaths_Child_second + count_deaths_Child_third + count_deaths_Child_crew
total_Both_deaths = count_deaths_Both_first + count_deaths_Both_second + count_deaths_Both_third + count_deaths_Both_crew
total_dph_Adult = ceiling((total_Adult_deaths/total_Adult_risk)*100)
total_dph_Child = ceiling((total_Child_deaths/total_Child_risk)*100)
total_dph_Both = ceiling((total_Both_deaths/total_Both_risk)*100)

#creating data frame for population exposed to risk
popl_data_risk <- data.frame(Economic_Status = c("I","II","III","Other","Total"),Adult_risk = c(count_Adult_risk_first,count_Adult_risk_second,count_Adult_risk_third,count_Adult_risk_crew,total_Adult_risk),Child_risk = c(count_Child_risk_first,count_Child_risk_second,count_Child_risk_third,count_Child_risk_crew,total_Child_risk),Both_risk = c(count_Both_risk_first,count_Both_risk_second,count_Both_risk_third,count_Both_risk_crew,total_Both_risk),stringsAsFactors = FALSE)

#Creating data frame for number of deaths
popl_data_death <- data.frame(Adult_deaths = c(count_deaths_Adult_first,count_deaths_Adult_second,count_deaths_Adult_third,count_deaths_Adult_crew,total_Adult_deaths),Child_deaths = c(count_deaths_Child_first,count_deaths_Child_second,count_deaths_Child_third,count_deaths_Child_crew,total_Child_deaths),Both_deaths = c(count_deaths_Both_first,count_deaths_Both_second,count_deaths_Both_third,count_deaths_Both_crew,total_Both_deaths),stringsAsFactors = FALSE)

#Creating data frame for Deaths per 100
popl_data_dph <- data.frame(Adult_dph = c(count_dph_Adult_risk_first,count_dph_Adult_risk_second,count_dph_Adult_risk_third,count_dph_Adult_risk_crew,total_dph_Adult),Child_dph = c(count_dph_Child_risk_first,count_dph_Child_risk_second,count_dph_Child_risk_third,count_dph_Child_risk_crew,total_dph_Child),Both_dph = c(count_dph_Both_first,count_dph_Both_risk_second,count_dph_Both_risk_third,count_dph_Both_risk_crew,total_dph_Both),stringsAsFactors = FALSE)

table2 <- cbind.data.frame(popl_data_risk,popl_data_death,popl_data_dph)
#Display table 1 and table 2
table1

table2
#Table generation using RShiny Package using table1 and table2

ui <- fluidPage(
  tableOutput('table1'),
  tableOutput('table2')
)

server <-  function(input, output, session) {
  output$table1 <- renderTable(table1, striped = FALSE, align = 'c')
  output$table2 <- renderTable(table2, striped = FALSE, align = 'c')
}

shinyApp(ui, server)

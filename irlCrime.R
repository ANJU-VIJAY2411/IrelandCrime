
#Read the dataset into a data frame called Ireland_crime. Then show the structure and 
#the first 10 rows of the dataset. Recode any missing data with NA.

Ireland_crime <- read.csv("IrelandCrime.csv" , na = "")
str(Ireland_crime)
Ireland_crime[!complete.cases(Ireland_crime),]

Ireland_crime[sample(1:10, 10, replace = FALSE),]



#We want to retain only the crime statistics for crime figures between 2015 to 2019. And 
#we need to update the variable names shown in the table below and update them to the 
#names shown under the heading Convert to in the table. For example, the variable called 
#borough should be changed to Region. Make the relevant changes to the content of the
#Ireland_crime data frame so that your variables are correctly named, and remove any
#unrequired variables.

Ireland_crime <-  subset(Ireland_crime ,select = c(1:5,54:72 ))

names(Ireland_crime)
names(Ireland_crime)[1] <- "Region"
names(Ireland_crime)[2] <- "Division"
names(Ireland_crime)[3] <- "OffenceCode"
names(Ireland_crime)[4] <- "Offence"
names(Ireland_crime)[5] <- "OffenceType"
names(Ireland_crime)

#Q3
#Some of the offence descriptions are very lengthy and we would like to modify them. 
#Update the offence descriptions with these new ones shown in this table

#ATTEMPTS/THREATS TO MURDER/ASSAULTS/      Murder/assault/harassment
#  HARASSMENTS AND RELATED OFFENCES
                                        
#DANGEROUS OR NEGLIGENT ACTS               Dangerous acts
#KIDNAPPING AND RELATED OFFENCES           Kidnapping
#ROBBERY/EXTORTION AND HIJACKING OFFENCES  Robbery
#THEFT AND RELATED OFFENCES                Theft
#FRAUD/DECEPTION AND RELATED OFFENCES      Fraud
#PUBLIC ORDER AND OTHER SOCIAL CODE OFFENCES Public order
#OFFENCES AGAINST GOVERNMENT/ JUSTICE        Offences against government
#PROCEDURES AND ORGANISATION OF CRIME




attach(Ireland_crime)
Ireland_crime$OffenceType[OffenceType == "ATTEMPTS/THREATS TO MURDER/ASSAULTS/ HARASSMENTS AND RELATED OFFENCES"] <- "Murder/assault/harassment"
Ireland_crime$OffenceType[OffenceType == "DANGEROUS OR NEGLIGENT ACTS"] <- "Dangerous acts"
Ireland_crime$OffenceType[OffenceType == "KIDNAPPING AND RELATED OFFENCES"] <- "Kidnapping"
Ireland_crime$OffenceType[OffenceType == "ROBBERY/EXTORTION AND HIJACKING OFFENCES"] <- "Robbery"
Ireland_crime$OffenceType[OffenceType == "THEFT AND RELATED OFFENCES"] <- "Theft"
Ireland_crime$OffenceType[OffenceType == "FRAUD/DECEPTION AND RELATED OFFENCES"] <- "Fraud"
Ireland_crime$OffenceType[OffenceType == "OFFENCES AGAINST GOVERNMENT/ JUSTICE PROCEDURES AND ORGANISATION OF CRIME"] <- "Offences against government"

names(Ireland_crime)


Ireland_crime$OffenceType[OffenceType == "Murder/assault/harassment"]


#Create a new variable called CrimeSummary that contains a summary count of each 
#crime. Then using the summary() function, discuss in a comment in your program code 
#the results that are shown in this new variable.


attach(Ireland_crime)
CrimeSummary <- X2015Q1 + X2015Q2 + X2015Q3 + X2015Q4 + X2016Q1 + X2016Q2 +X2016Q3+ X2016Q4 + X2016Q4 + X2017Q1 + X2017Q2 + X2017Q3 +X2017Q4+X2018Q1+ X2018Q2+ X2018Q3+ X2018Q4+ X2019Q1+ X2019Q2+ X2019Q3
detach(Ireland_crime)

# Now add computed columns to
# the new_managers data frame
Ireland_crime <- data.frame(Ireland_crime, CrimeSummary)
head(Ireland_crime)

summary(Ireland_crime)

#Min.   :    0.0  
#1st Qu.:    7.0  
#Median :   41.0  
#Mean   :  660.7  
#3rd Qu.:  369.0  
#Max.   :23817.0  


#Q5

#Using the VIM package, check the Ireland_crime data frame for missing data. Decide 
#whether the data for “Offence” is either missing completely at random, missing at 
#random, or not missing at random, and justify your decision by discussing how your made 
#your choice within a comment in your program code.

#Then construct a comment within your program code on what you should do regarding 
#missing data within the Ireland_crime data frame. If possible, regenerate missing data 
#from information available within the data frame. Finally, indicate how many complete 
#rows of data exist after you have removed the missing data. Add detailed comments to 
#your program code that justify any decisions you made.






install.packages("VIM")
library(VIM)
missing_values <- aggr(Ireland_crime, prop = FALSE, numbers = TRUE)

sum(is.na(Ireland_crime$Offence))


#Q6

Ireland_crime$Region[Ireland_crime$CrimeSummary == 23817]


#Q7

Donegal_crime = subset(Ireland_crime,Division == "DONEGAL")


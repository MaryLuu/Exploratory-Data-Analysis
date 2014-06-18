## Exploratory Data Analysis
# Course Project 2

###########################################################################################################
# Conection
#setwd("C:/Users/PCPC/Desktop/Exploratory Data Analysis/Projekt do 22/exdata-data-NEI_data")
#getwd()

###########################################################################################################

## Assignment

# The overall goal of this assignment is to explore the National Emissions Inventory database and see what
# it say about fine particulate matter pollution in the United states over 
# the 10-year period 1999–2008. You may use any R package you want to support your analysis.

## Plot No_1

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
# Using the base plotting system, make a plot showing the total PM2.5 emission from
# all sources for each of the years 1999, 2002, 2005, and 2008.

## Loading data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## 
attach(NEI)
a <- tapply((Emissions)/1000,year,sum)

png('plot1.png', width=800, height=500)

barplot(a, main = "Total emissions from PM2.5 in US (1999-2008)", xlab = 'Year', ylab = 'Emission PM2.5 in Kilotons', col = c("orange", "light blue", "light green", "grey") )

dev.off()

## Plot No_6

# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle
# sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

## Loading data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##

data <- subset(NEI, (NEI[,1]=="24510" & NEI[,5]=="ON-ROAD" ))
data$year <- factor(data$year, levels=c('1999', '2002', '2005', '2008'))
BC <- cbind(aggregate(data[,4],list(data[,6]), sum), City = "BC")
colnames(BC) <- c("year", "Emissions", "City")

##

data1 <- subset(NEI, (NEI[,1]=="06037" & NEI[,5]=="ON-ROAD" ))
data1$year <- factor(data1$year, levels=c('1999', '2002', '2005', '2008'))
AC <- cbind(aggregate(data1[,4],list(data1[,6]), sum), City = "AC")
colnames(AC) <- c("year", "Emissions", "City")

ACBC <- rbind.data.frame (AC, BC)

##

png('plot6.png',  width=800, height=500)

ggplot(ACBC, aes(year, Emissions)) + geom_bar(aes(fill=year), stat = "identity") + facet_grid(. ~ City) +
  ggtitle('Total Emissions from motor vehicle sources in Los Angeles vs. in Baltimore City') + 
  ylab( 'Emission PM2.5') + xlab('Year') + 
  geom_text(aes(label=round(Emissions), size=2, hjust=0.5, vjust=-0.55))

dev.off()

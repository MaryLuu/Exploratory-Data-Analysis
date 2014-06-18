## Plot No_3

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City?
# Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make
# a plot answer this question.

## Loading data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# which(fips=="24510")

data <- NEI[which(NEI[,1]=="24510"),]
data$year <- factor(data$year, levels=c('1999', '2002', '2005', '2008'))
tapply(data[,4]/1000,data[,6], sum)

##

png('plot3.png', width=800, height=500)

ggplot(data, aes(year, log(Emissions)))+ geom_boxplot(aes(color = type),nrow = 1, size = 1)+ facet_grid(.~ type)+
  stat_boxplot(geom ='errorbar') + geom_jitter(alpha=0.06) +
  ylab('Log-emissions from PM2.5 in Baltimore City (1999-2008)') + xlab('Year') + 
  ggtitle('Emissions per type in Baltimore City')
  
dev.off()


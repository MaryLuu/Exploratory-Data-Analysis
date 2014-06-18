## Plot No_5

# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

## Loading data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

data <- subset(NEI, (NEI[,1]=="24510" & NEI[,5]=="ON-ROAD" ))
data$year <- factor(data$year, levels=c('1999', '2002', '2005', '2008'))
d <- aggregate(data[,4],list(data[,6]), sum)
colnames(d) <- c("year", "Emissions")

##

png('plot5.png', width=800, height=500)

ggplot(d, aes(year, Emissions)) +
    geom_bar(aes(fill=year),stat = "identity") + 
    ggtitle('Total emissions from motor vehicle in Baltimore City (1999-2008)') + 
    xlab('Year') +
    ylab('Kilotons emission PM2.5') + 
    geom_text(aes(label=round(Emissions), size=5, hjust=1, vjust=0))

dev.off()

## Plot No_4

# Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

## Loading data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

names(NEI)
head(SCC)

coal = SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]
join <- merge(NEI, coal, by = "SCC")
c <- aggregate(join[,4]/1000,list(join[,6]), sum)
colnames(c) <- c("year", "Emissions")

##

png('plot4.png', width=800, height=500)

ggplot(c, aes(year, Emissions/1000)) + 
  geom_point(color = "red") + geom_line(aes(group=1, col=Emissions)) + 
  ggtitle('Total emissions from PM2.5 (1999–2008)') + 
  xlab('Year') +
  ylab('Kilotons emission PM2.5') + 
  geom_text(aes(label=round(Emissions/1000,digits=2), size=2, hjust=1.5, vjust=1.5))

dev.off()


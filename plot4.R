## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# 4.Across the United States, how have emissions from coal combustion-related sources 
# changed from 1999-2008?

df <- subset(SCC, select = c("SCC", "Short.Name","EI.Sector"))
NEI_SCC <- merge(NEI, df, by.x="SCC")
NEI_Coal <- subset(NEI_SCC, grepl('Coal',NEI_SCC$EI.Sector, fixed=TRUE),
                   c("Emissions", "year","type", "Short.Name"))
plt <- aggregate(Emissions ~ year, NEI_Coal, sum)


barplot(
  (plt$Emissions)/10^3,
  names.arg=plt$year,
  xlab="Year",
  ylab="PM2.5 Emissions(10^3 Tons)",
  main="Total PM2.5 Emissions From All US Coal Industries")

dev.copy(png,"plot4.png", width=480, height=480)
dev.off()

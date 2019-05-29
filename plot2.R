## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# 2.Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
# (fips=="24510") from 1999 to 2008? Use the base plotting system to make a plot answering
# this question.

NEI_Balt<-subset(NEI,fips=="24510")

total.Year.Balt <- aggregate(Emissions ~ year,NEI_Balt, sum)

barplot(
  (total.Year.Balt$Emissions),
  names.arg=total.Year.Balt$year,
  xlab="Year",
  ylab="PM2.5 Emissions (10^6 Tons)",
  main="Total PM2.5 Emissions From Batimore")

dev.copy(png,"plot2.png", width=480, height=480)
dev.off()

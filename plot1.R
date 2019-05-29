## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# 1.Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
# Using the base plotting system, make a plot showing the total PM2.5 emission from all 
# sources for each of the years 1999, 2002, 2005, and 2008.

total.Year <- aggregate(Emissions ~ year,NEI, sum)

barplot(
  (total.Year$Emissions)/10^6,
  names.arg=total.Year$year,
  xlab="Year",
  ylab="PM2.5 Emissions (10^6 Tons)",
  main="Total PM2.5 Emissions From All US Sources")

dev.copy(png,"plot1.png", width=480, height=480)
dev.off()

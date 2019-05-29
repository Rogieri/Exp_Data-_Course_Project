## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# 5.How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]

NEI_Vehi_Balt <- subset(vehiclesNEI,fips=="24510")

plt_blt <- aggregate(Emissions ~ year, NEI_Vehi_Balt, sum)

barplot(
  (plt_blt$Emissions),
  names.arg=plt_blt$year,
  xlab="Year",
  ylab="PM2.5 Emissions (Tons)",
  main="Total PM2.5 Emissions From Vehicles in Baltimore")


dev.copy(png,"plot5.png", width=480, height=480)
dev.off()
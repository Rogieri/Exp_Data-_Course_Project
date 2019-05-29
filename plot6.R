## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# 6.Compare emissions from motor vehicle sources in Baltimore City with emissions from motor
# vehicle sources in Los Angeles County, California  (fips=="06037"). Which city has
# seen greater changes over time in motor vehicle emissions

vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]

NEI_Vehi_Balt <- cbind(subset(vehiclesNEI,fips=="24510"),city="Baltimore")
NEI_Vehi_LA   <- cbind(subset(vehiclesNEI,fips=="06037"),city="Los Angeles")

plt_blt <- aggregate(Emissions ~ year, NEI_Vehi_Balt, sum)
plt_LA  <- aggregate(Emissions ~ year, NEI_Vehi_LA, sum)

NEI_Vehi<-rbind(NEI_Vehi_Balt,NEI_Vehi_LA)

library(ggplot2)

plt <- ggplot(NEI_Vehi,aes(factor(year),Emissions,fill=city)) +
  geom_bar(stat="identity") +
  theme_bw() + guides(fill=FALSE)+
  facet_grid(.~city,scales = "free",space="free") + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions, 1999-2008 by Vehicles"))

print(plt)

dev.copy(png,"plot6.png", width=480, height=480)
dev.off()
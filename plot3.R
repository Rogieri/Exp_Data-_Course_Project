## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# 3.Of the four types of sources indicated by the Type (point, nonpoint, onroad, nonroad)
# variable, which of these four sources have seen decreases in emissions from 1999-2008 
# for Baltimore City? Which have seen increases in emissions from 1999-2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

NEI_Balt<-subset(NEI,fips=="24510")
total.Year.Balt.tp  <- aggregate(NEI_Balt["Emissions"],list(year=NEI_Balt$year,type=NEI_Balt$type),sum)

library(ggplot2)

plt <- ggplot(total.Year.Balt.tp,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  theme_bw() + guides(fill=FALSE)+
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))

print(plt)

dev.copy(png,"plot3.png", width=480, height=480)
dev.off()
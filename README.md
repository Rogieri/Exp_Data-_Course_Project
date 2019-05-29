# Exploratory Data Analysis
## Course Project 2

### 1.Importing Data from Working Directory

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

### 2.Preparing Data and Ploting

Look at codes Plot1.R, PLot2.R,etc. to see how it was prepared.

### 3.Answering Questions With Plots

1.Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
Answer: The plot says that total emissions have decreased in the US from 1999 to 2008

2.Have total emissions from PM2.5 decreased in the Baltimore City, Maryland from 1999 to 2008?
Answer:Yes, total emissions from PM2.5 have decreased in Baltimore City, Maryland from 1999 to 2008.

3.Of the four types of sources indicated by the Type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City?
Answer:The non-road, nonpoint, on-road source types have all seen decreased emissions overall from 1999-2008 in Baltimore City.

4.Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
Answer: Emissions from coal combustion related sources have decreased from 30% from 1999-2008

5.How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
Answer: It has decreased 60%

6.Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California. Which city has seen greater changes over time in motor vehicle emissions.
Answer: In absolute Numbers LA contributed more to the US reductions but percentualy we may say that the decrease was greater in Baltimore.

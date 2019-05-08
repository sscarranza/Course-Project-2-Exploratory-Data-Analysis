# Course Project 2: Exploratory Data Analysis
# SABRINA KATE S. CARRANZA | PLOT #2

## This command calls the downloadarchive.R which will download the extract the source
source("archive.R")

## Load the data

NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

baltimorenei <- (NEI[NEI$fips == "24510",])
aggdatabaltimore <- aggregate(Emissions~year,data = baltimorenei,FUN = sum)

## Create BarPlot and Export as PNG file

png(filename = "plot2.png",width = 480, height = 480,units = "px")

barplot(aggdatabaltimore$Emissions,
        names.arg = aggdatabaltimore$year,
        col = "blue",
        xlab = "Years",
        ylab = "PM2.5 Emissions by Ton",
        main = "PM2.5 Emissions for Baltimore (Total)"
        )

dev.off()
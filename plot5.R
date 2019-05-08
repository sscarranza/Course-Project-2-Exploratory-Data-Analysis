# Course Project 2: Exploratory Data Analysis
# SABRINA KATE S. CARRANZA | PLOT #5

## This command calls the downloadarchive.R which will download the extract the source
source("archive.R")

## Load the Libraries
library(ggplot2)

## Load the data

NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

## Filter SCC dataset for Vehicle Entries

vehicles <- grepl(pattern = "vehicle",x = SCC$SCC.Level.Two,ignore.case = TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]

baltimorevehiclesnei <- (vehiclesNEI[vehiclesNEI$fips == "24510",])

## Create BarPlot and Export as PNG file

png(filename = "plot5.png",width = 480, height = 480,units = "px",)

g <- ggplot(data = baltimorevehiclesnei, aes(factor(year), Emissions)) +
        geom_bar(stat = "identity",fill = "grey", width = 0.75) +
        theme_grey(base_size = 14,base_family = "") +
        labs(x="Year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
        labs(title=expression("PM"[2.5]*" Vehicle Source Emissions, Baltimore City"))

print(g)
dev.off()
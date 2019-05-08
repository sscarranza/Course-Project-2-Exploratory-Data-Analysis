# Course Project 2: Exploratory Data Analysis
# SABRINA KATE S. CARRANZA | PLOT #4

## This command calls the downloadarchive.R which will download the extract the source
source("archive.R")

## Load the Libraries
library(ggplot2)

## Load the data

NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

## Filter SCC dataset for Combustion Related and Coal Related Entries

combustion <- grepl(pattern = "combust",x = SCC$SCC.Level.One,ignore.case = TRUE)
coal <- grepl(pattern = "coal",x = SCC$SCC.Level.Four,ignore.case = TRUE)
combustioncoal <- (combustion & coal)
combustionSCC <- SCC[combustioncoal,]$SCC
combustionNEI <- NEI[NEI$SCC %in% combustionSCC,]

## Create BarPlot and Export as PNG file

png(filename = "plot4.png",width = 480, height = 480,units = "px",)

g <- ggplot(data = combustionNEI, aes(factor(year), Emissions/10^5)) +
        geom_bar(stat = "identity",fill = "grey", width = 0.75) +
        theme_grey(base_size = 14,base_family = "") +
        labs(x="Year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
        labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions - US 1999-2008"))

print(g)
dev.off()
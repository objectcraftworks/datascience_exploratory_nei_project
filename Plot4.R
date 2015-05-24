source("./load_data.R")
library(ggplot2)

scc_file <- "./data/Source_Classification_Code.rds"

NEI <- load_nei()

SCC <- readRDS(scc_file)

#coal source can be fetched from EI.Sector or Level.Three
SCC.coal <-  SCC[grepl("Coal",SCC$SCC.Level.Three),"SCC"]
SCC.coal <- unique(as.character(SCC.coal))

NEI.coal <- NEI[NEI$SCC %in% SCC.coal,]

totalPMFromCoalByYear <- aggregate(Emissions ~ year, data=NEI.coal,sum)

## to kilo tons
totalPMFromCoalByYear$Emissions <- totalPMFromCoalByYear$Emissions / 1000

#plot

plot <- qplot(year, Emissions,data=totalPMFromCoalByYear, 
              geom=c("point","line") ,
              main="Total Fine particulate matter (PM2.5) emissions from Coal Sources in USA",
              xlab="Year",
              ylab="Fine particulate matter (PM2.5) in Kilo tons")

ggsave(plot,file="plot4.png",width=7.89,height=5.01)

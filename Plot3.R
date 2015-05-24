source("./load_data.R")
library(ggplot2)

NEI <- load_nei()

#baltimore fips :24510
baltimore_nei <- subset(NEI,fips == "24510")
#labels for type
baltimore_nei <- transform(baltimore_nei, type=factor(type))

totalPMByYear <- aggregate(Emissions ~ year +type, data=baltimore_nei,sum)

#plot
png("./plot3.png") # this creates 480X480px png file

plot <- qplot(year, Emissions,data=totalPMByYear, 
       geom=c("point","line") ,
      facets= . ~ type,
     main="Total Fine particulate matter (PM2.5) emission in Baltimore,MD",
     xlab="Year",
     ylab="Fine particulate matter (PM2.5) in tons")

print(plot) 

dev.off()


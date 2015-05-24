source("./load_data.R")
library(ggplot2)

NEI <- load_nei()

#baltimore fips :24510 and on road -> motor vehicles
baltimore_motor_vehicles_nei <- subset(NEI,fips == "24510" & type == "ON-ROAD")

totalPMByYear <- aggregate(Emissions ~ year, data=baltimore_motor_vehicles_nei,sum)

#plot

plot <- qplot(year, Emissions,data=totalPMByYear, 
              geom=c("point","line") ,
              main="Total Fine particulate matter (PM2.5) emission from motor vehicles in Baltimore,MD",
              xlab="Year",
              ylab="Fine particulate matter (PM2.5) in tons")

 ggsave(plot,file="plot5.png",width=7.89,height=5.01)



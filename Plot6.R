source("./load_data.R")
library(ggplot2)

NEI <- load_nei()

#baltimore fips :24510
baltimore_nei <- subset(NEI,type == "ON-ROAD" & fips %in% c("24510","06037"))
#labels for fips
baltimore_nei <- transform(baltimore_nei, fips=factor(fips))

totalPMByYear <- aggregate(Emissions ~ year +fips, data=baltimore_nei,sum)

#plot

plot <- ggplot( data=totalPMByYear,aes(year,Emissions,color=fips,group=fips)) +
        geom_line() +
        geom_point() +
        labs(title="Total Fine particulate matter (PM2.5) emission from motor vehicles\n in Baltimore and Los Angeles") +
        labs(x="Year") +
        labs(y="Fine particulate matter (PM2.5) in tons") +
        scale_colour_discrete(name  ="Counties",
                        breaks=c("24510", "06037"),
                        labels=c("Baltimore City, MD", "Los Angeles County")) 
  
        
ggsave(plot,file="plot6.png",width=7.89,height=5.01)

source("./load_data.R")

NEI <- load_nei()
# sum of all sources by year
totalPMByYear <- aggregate(Emissions ~ year, data=NEI,sum)
# convert to kilo tons
totalPMByYear$Emissions <- totalPMByYear$Emissions / 1000
#plot
png("./plot1.png") # this creates 480X480px png file

plot(totalPMByYear$year, totalPMByYear$Emissions,type="b",
     main="Total Fine particulate matter (PM2.5) emission in USA",
     xlab="Year",
     ylab="Fine particulate matter (PM2.5) in kilo tons")

dev.off()


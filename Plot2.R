source("./load_data.R")

NEI <- load_nei()

#baltimore fips :24510
baltimore_nei <- subset(NEI,fips == "24510")

# sum of all sources in baltimore by year
totalPMByYear <- aggregate(Emissions ~ year, data=baltimore_nei,sum)

# convert to kilo tons
totalPMByYear$Emissions <- totalPMByYear$Emissions / 1000

#plot
png("./plot2.png") # this creates 480X480px png file

plot(totalPMByYear$year, totalPMByYear$Emissions,type="b",
     main="Total Fine particulate matter (PM2.5) emission in Baltimore,MD",
     xlab="Year",
     ylab="Fine particulate matter (PM2.5) in kilo tons")

dev.off()


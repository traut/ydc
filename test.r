
library(sp)
library(ggmap)
library(qmap)
library(RColorBrewer)


center <- geocode('Phoenix, AZ, USA')

rows <- read.csv("./id-type-reviews-lat-lon-stars-wifi-alcohol.csv")
names(rows) <- c("id", "type", "review_count", "latitude", "longitude", "stars", "wifi", "alcohol")

#png("bus-map.png", width=1000, height=800, res=1200)

PhoenixMap <- qmap(location = 'Phoenix, AZ, USA', zoom = 10, color = 'bw', legend = 'topleft')
PhoenixMap + geom_point(aes(x=longitude, y=latitude, size=review_count, colour=alcohol), data=rows) + scale_colour_gradient(low="red", high="green", space="Lab")

boxplot(rows$review_count ~ rows$alcohol)

#dev.off()

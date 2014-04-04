
library(sp)
library(ggmap)
library(ggplot2)
library(qmap)
library(RColorBrewer)

#png("bus-map.png", width=1000, height=800, res=1200)
#center <- geocode('Phoenix, AZ, USA')
#PhoenixMap <- qmap(location = 'Phoenix, AZ, USA', zoom = 10, color = 'bw', legend = 'topleft')
#PhoenixMap + geom_point(aes(x=longitude, y=latitude, size=review_count, colour=alcohol), data=rows) + scale_colour_gradient(low="red", high="green", space="Lab")

bussiness <- read.csv("./bussiness.csv")
names(bussiness) <- c("bid", "btype", "review_count", "latitude", "longitude", "bstar", "wifi", "alcohol")

review <- read.csv("./review.csv")
names(review) <- c("rid", "bid", "uid", "rtype", "rstar", "date")

data <- merge(bussiness, review)

ggplot(bussiness[bussiness$review_count < 100,], aes(x=review_count)) + 
          theme_bw() + geom_histogram(colour = "darkgreen", fill = "white", binwidth=5) + 
          facet_wrap(~bstar, nrow=3, ncol=3) + geom_density()

aggr_mean <- aggregate(rstar ~ bid + review_count, data=data, FUN=mean)
ggplot(aggr_mean, aes(x=review_count, y=rstar)) + geom_point() + geom_smooth()

aggr_var <- aggregate(rstar ~ bid + review_count, data=data, FUN=var)
ggplot(aggr_var, aes(x=review_count, y=rstar)) + geom_point() + geom_smooth()

most_reviews <- bussiness[which.max(bussiness$review_count),]
most_reviews <- data[data$bid == most_reviews$bid,]
table(most_reviews$rstar)

#aggr <- aggregate(rstar ~ bstar, data=data, FUN=function(x) c(mean=mean(x), n=length(x), var=var(x)))

#dev.off()

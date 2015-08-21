library(rCharts)
library(fmsb)

#load pitcher data
hitters<- read.csv("hitters.csv", header=T)

#sort pitchers matrix to only include normalized data
hitters.sorted<-hitters[,c(1,3,5,7,9,11)]

h1t4 <- hitters[c(1,2,3,4),]

#plotting; farther towards the outside edge is better in all instances
#i.e., a low BB% is closer to the edge
par(mar=c(0, 1, 1, 0)) #decrease default margin
layout(matrix(1:6, ncol=3)) #draw 4 plots to device

#par(mfrow=n2mfrow(nrow(pitchers.sorted))
#mar=rep(3, 6))
#loop over rows to draw them, add 1 as max and 0 as min for each var
lapply(1:6, function(i) { 
  radarchart(rbind(rep(1,6), rep(0,6), hitters.sorted[i,-1]), pdensity=c(0, 0, 100), 
             title=hitters.sorted[i, 1], maxmin=F, axistype=0, centerzero=T)
})

hit.labels =c("Defense", 'Walk Rate', 'K Rate', 'ISO', 'Speed')
#for a single hitter
one.hitter<-hitters.sorted[113,]  #different number for each hitter. call hitters.sorted and find
#the hitter you need first
lapply(1:1, function(i) { 
  radarchart(rbind(rep(1,1), rep(0,1), one.hitter[i,-1]), pdensity=c(0, 0, 100), 
             title=one.hitter[i, 1], maxmin=F, axistype=0, centerzero=T, vlabels=hit.labels, vlcex=1)
})
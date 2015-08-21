library(fmsb)
library(rCharts)

#load pitcher data
pitchers<- read.csv("pitchers.csv", header=T)

#sort pitchers matrix to only include normalized data
pitchers.sorted<-pitchers[,c(1,3,5,7,9,11,13)]

p1t4 <- pitchers[c(1,2,3,4),]

kershaw<-p1t4[1, c(2,3,4,5,6,7)]


#plotting; farther towards the outside edge is better in all instances
#i.e., a low BB% is closer to the edge
par(mar=c(0, 1, 1, 0)) #decrease default margin
layout(matrix(1:6, ncol=3)) #draw 6 plots to device

#par(mfrow=n2mfrow(nrow(pitchers.sorted))
#mar=rep(3, 6))
#loop over rows to draw them, add 1 as max and 0 as min for each var
lapply(1:6, function(i) { 
  radarchart(rbind(rep(1,6), rep(0,6), pitchers.sorted[i,-1]), pdensity=c(0, 0, 100), 
             title=pitchers.sorted[i, 1], maxmin=F, axistype=0, centerzero=T)
})

pitch.labels =c("HR/9", 'K%', 'BB%', 'WHIP', 'BABIP', 'FIP')

#for a single pitcher
one.pitcher<-pitchers.sorted[42,]
lapply(1:1, function(i) { 
  radarchart(rbind(rep(1,1), rep(0,1), one.pitcher[i,-1]), pdensity=c(0, 0, 100), 
             title=one.pitcher[i, 1], maxmin=F, axistype=0, centerzero=T, vlabels=pitch.labels)
})


radarchart(rbind(rep(1,1), rep(0,1), one.pitcher[1,-1]), pdensity=c(0, 0, 100), 
           title=one.pitcher[1, 1], maxmin=F, axistype=0, centerzero=T, vlabels=pitch.labels)
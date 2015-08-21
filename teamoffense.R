#teamoffense.R

library(rCharts)
library(fmsb)

#load team offense data
team.offense<- read.csv("teamoffense.csv", header=T)

#sort pitchers matrix to only include normalized data
team.offense.z<-team.offense[,c(1,3,5,7,9,11)]

#h1t4 <- hitters[c(1,2,3,4),]

#plotting; farther towards the outside edge is better in all instances
#i.e., a low BB% is closer to the edge
par(mar=c(0, 1, 1, 0)) #decrease default margin
layout(matrix(1:30, ncol=6)) #draw 4 plots to device

#loop over rows to draw them, add 1 as max and 0 as min for each var
lapply(1:30, function(i) { 
  radarchart(rbind(rep(1,6), rep(0,6), team.offense.z[i,-1]), pdensity=c(0, 0, 100), 
             title=team.offense.z[i, 1], maxmin=F, axistype=0, centerzero=T, vlabels=offense.labels)
})

offense.labels =c('Walk Rate', 'K Rate', 'ISO', 'Speed', "Defense")
#for a single hitter
one.team.offense<-team.offense.z[11,]  #different number for each hitter. call hitters.sorted and find
#the hitter you need first
lapply(1:1, function(i) { 
  radarchart(rbind(rep(1,1), rep(0,1), one.team.offense[i,-1]), pdensity=c(0, 0, 100), 
             title=one.team.offense[i, 1], maxmin=F, axistype=0, centerzero=T, vlabels=offense.labels, vlcex=1)
})
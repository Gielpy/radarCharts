#teampitching.R

library(fmsb)

#load pitcher data
team.pitching<- read.csv("teampitching.csv", header=T)

#sort pitchers matrix to only include normalized data
team.pitching.z<-team.pitching[,c(1,3,5,7,9,11,13)]

#plotting; farther towards the outside edge is better in all instances
#i.e., a low BB% is closer to the edge
par(mar=c(0, 1, 1, 0)) #decrease default margin
layout(matrix(1:30, ncol=6)) #draw 6 plots to device

#par(mfrow=n2mfrow(nrow(pitchers.sorted))
#mar=rep(3, 6))
#loop over rows to draw them, add 1 as max and 0 as min for each var
lapply(1:30, function(i) { 
  radarchart(rbind(rep(1,6), rep(0,6), team.pitching.z[i,-1]), pdensity=c(0, 0, 100), 
             title=team.pitching.z[i, 1], maxmin=F, axistype=0, centerzero=T, vlabels=pitch.labels)
})

pitch.labels =c("HR/9", 'K%', 'BB%', 'WHIP', 'BABIP', 'FIP')

#for a single pitcher
one.team.pitching<-team.pitching.z[30,]
lapply(1:1, function(i) { 
  radarchart(rbind(rep(1,1), rep(0,1), one.team.pitching[i,-1]), pdensity=c(0, 0, 100), 
             title=one.team.pitching[i, 1], maxmin=F, axistype=0, centerzero=T, vlabels=pitch.labels)
})
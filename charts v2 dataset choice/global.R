#global.R

library(shiny)
library(fmsb)

hitters<- read.csv("hitters.csv", header=T)
hitters.sorted<-hitters[,c(1,3,5,7,9,11)]

pitchers<- read.csv("pitchers.csv", header=T)
pitchers.sorted<-pitchers[,c(1,3,5,7,9,11,13)]

pitch.labels =c("HR/9", 'K%', 'BB%', 'WHIP', 'BABIP', 'FIP')
hit.labels =c("Defense", 'Walk Rate', 'K Rate', 'ISO', 'Speed')
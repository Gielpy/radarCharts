#Team Hitting Data (vs. Righties)

library(XML)
library(httr)

#pull the specific data from the url below
url <- "http://www.fangraphs.com/leaders.aspx?pos=all&stats=bat&lg=all&qual=0&type=c,34,35,37,40,111,199&season=2011&month=0&season1=&ind=0&team=0,ts&rost=&age=&filter=&players=0"
tables <- readHTMLTable(url)
n.rows <- unlist(lapply(tables, function(t) dim(t)[1]))
leaderboard<-data.frame(tables$LeaderBoard1_dg1_ctl00)


#scale data between 0 and 1
scale.normal<-function(m){
  (m - min(m))/(max(m)-min(m))
}

#inverse scale data between 0 and 1
scale.inverse<-function(m){
  1-((m - min(m))/(max(m)-min(m)))
}

#remove the rankings column at the beginning of the data frame
leaderboard$X. <- NULL

#remove the % from the walk and strikeout columns
leaderboard$BB. <- gsub(" %", "", leaderboard$BB.)
leaderboard$K. <- gsub(" %", "", leaderboard$K.)

#normalize the columns between 0 and 1
leaderboard$BsR <- scale.normal(as.numeric(leaderboard$BsR))
leaderboard$BB. <- scale.normal(as.numeric(leaderboard$BB.))
leaderboard$K. <- scale.inverse(as.numeric(leaderboard$K.))
leaderboard$OBP <- scale.normal(as.numeric(leaderboard$OBP))
leaderboard$ISO <- scale.normal(as.numeric(leaderboard$ISO))
leaderboard$Def <- scale.normal(as.numeric(leaderboard$Def))


library(rCharts)
library(fmsb)

#pull one team from leaderboard for plotting
one.team<-leaderboard[5,]  #different number for each hitter. call hitters.sorted and find

#provide labels for the radar chart
offense.labels =c("Walk Rate", 'K Rate', 'OBP', 'ISO', 'Baserunning', 'Defense')

#plot the radar chart for the team's offensive capabilities
lapply(1:1, function(i) { 
  radarchart(rbind(rep(1,1), rep(0,1), one.team[i,-1]), pdensity=c(0, 0, 100), 
             title=expression(paste(one.team[i, 1], "Team Hitting (vs. Righties)")), maxmin=F, axistype=0, centerzero=T, vlabels=offense.labels, vlcex=1)
})
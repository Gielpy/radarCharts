#Team Pitching Data (vs. Righties)

library(XML)
library(httr)

#pull the specific data from the url below
url <- "http://www.fangraphs.com/leaders.aspx?pos=all&stats=pit&lg=all&qual=0&type=c,29,31,44,45,47,34&season=2015&month=14&season1=2015&ind=0&team=0,ts&rost=0&age=0&filter=&players=0"
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
leaderboard$WHIP <- scale.normal(as.numeric(leaderboard$WHIP))
leaderboard$BB. <- scale.inverse(as.numeric(leaderboard$BB.))
leaderboard$K. <- scale.normal(as.numeric(leaderboard$K.))
leaderboard$HR.9 <- scale.normal(as.numeric(leaderboard$HR.9))
leaderboard$wOBA <- scale.normal(as.numeric(leaderboard$wOBA))
leaderboard$FIP <- scale.normal(as.numeric(leaderboard$FIP))


library(rCharts)
library(fmsb)

#pull one team from leaderboard for plotting
one.team<-leaderboard[22,]  #different number for each hitter. call hitters.sorted and find

#provide labels for the radar chart
pitching.labels =c("HR/9", 'WHIP', 'K%', 'BB%', 'wOBA', 'FIP')

#plot the radar chart for the team's pitching capabilities
lapply(1:1, function(i) { 
  radarchart(rbind(rep(1,1), rep(0,1), one.team[i,-1]), pdensity=c(0, 0, 100), 
             title=paste(one.team[i, 1], "Team Pitching (vs. Righties)"), maxmin=F, axistype=0, centerzero=T, vlabels=pitching.labels, vlcex=1)
})
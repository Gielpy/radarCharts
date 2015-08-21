#learning scraping data from Fangraphs for radar charts

library(XML)

url <- "http://games.espn.go.com/ffl/boxscorefull?leagueId=74920&teamId=5&scoringPeriodId=15&seasonId=2014&view=scoringperiod&version=full"
data <- readHTMLTable(url, stringsAsFactors = FALSE)
data[[1]] # select the first table
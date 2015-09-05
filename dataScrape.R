#learning scraping data from Fangraphs for radar charts

library(XML)
library(httr)

url <- "http://games.espn.go.com/ffl/boxscorefull?leagueId=446910&teamId=3&scoringPeriodId=15&seasonId=2014&view=scoringperiod&version=full"
data <- readHTMLTable(url, stringsAsFactors = FALSE)
data[[1]] # select the first table

//*[@id="playertable_0"]/tbody

cafile <- system.file("CurlSSL", "cacert.pem", package = "RCurl")

# Read page
page <- GET(
  "https://ned.nih.gov/", 
  path="search/ViewDetails.aspx", 
  query="NIHID=0010121048",
  config(cainfo = cafile)
)

# Use regex to extract the desired table
x <- text_content(page)
tab <- sub('.*(<table class="grid".*?>.*</table>).*', '\\1', x)

# Parse the table
readHTMLTable(tab)




handle <- handle("http://games.espn.go.com/ffl/boxscorefull?leagueId=74920&teamId=5&scoringPeriodId=15&seasonId=2014&view=scoringperiod&version=full") 
path   <- "amember/login.php"

# fields found in the login form.
login <- list(
  amember_login = "powellcua"
  ,amember_pass  = "yellow"
)

response <- POST(handle = handle, path = path, body = login)


url <- "http://games.espn.go.com/ffl/boxscorefull?leagueId=74920&teamId=5&scoringPeriodId=15&seasonId=2014&view=scoringperiod&version=full"
data <- readHTMLTable(url)
data[[1]]
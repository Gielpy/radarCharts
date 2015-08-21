#server.R

library(shiny)
library(fmsb)

hitters<- read.csv("hitters.csv", header=T)
hitters.sorted<-hitters[,c(1,3,5,7,9,11)]

pitchers<- read.csv("pitchers.csv", header=T)
pitchers.sorted<-pitchers[,c(1,3,5,7,9,11,13)]

pitch.labels =c("HR/9", 'K%', 'BB%', 'WHIP', 'BABIP', 'FIP')
hit.labels =c("Defense", 'Walk Rate', 'K Rate', 'ISO', 'Speed')


shinyServer(
  function(input, output){observe({
    
    output$text1 <- renderText({ 
      paste("You have selected", input$var)
    })
    
      one.pitcher = subset(pitchers.sorted, pitchers.sorted$Name==input$var)
      output$radar <- renderPlot({
        radarchart(rbind(rep(1,1), rep(0,1), one.pitcher[1,-1]), pdensity=c(0, 0, 100), 
                   title=one.pitcher[1, 1], maxmin=F, axistype=0, centerzero=T, vlabels=pitch.labels)
      })

  })
  }
)
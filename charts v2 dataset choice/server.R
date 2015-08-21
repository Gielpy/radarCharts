#server.R

shinyServer(
  function(input, output){
    observe({
      
      if(input$radio == 1){
        one.pitcher = subset(pitchers.sorted, pitchers.sorted$Name==input$var)
        
        output$radar <- renderPlot({
          radarchart(rbind(rep(1,1), rep(0,1), one.pitcher[1,-1]), pdensity=c(0, 0, 100), 
                     title=one.pitcher[1, 1], maxmin=F, axistype=0, centerzero=T, vlabels=pitch.labels)
        })
      }else{
        one.hitter = subset(hitters.sorted, hitters.sorted$Name==input$var2)
        
        output$radar <- renderPlot({
          radarchart(rbind(rep(1,1), rep(0,1), one.hitter[1,-1]), pdensity=c(0, 0, 100), 
                     title=one.hitter[1, 1], maxmin=F, axistype=0, centerzero=T, vlabels=hit.labels)
        })
      }
    } 
  )}
)
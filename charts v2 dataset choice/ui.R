#ui.R

library(shiny)

shinyUI(fluidPage(
  titlePanel("The Modern Toolbox"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Create radar charts of baseball players and teams."),
      
      radioButtons("radio", label = h3("Choose your dataset"),
                   choices = list("Pitchers" = 1, "Hitters" = 2), 
                   selected = 1),
      
      conditionalPanel(condition = "input.radio == '1'",
        selectInput("var",
                  label="Choose a pitcher",
                  choices=c(levels(pitchers.sorted$Name)),
                  selected="Pick one"
      )
      ),
      
      conditionalPanel(condition = "input.radio == '2'",
            selectInput("var2",
                            label="Choose a hitter",
                            choices=c(levels(hitters.sorted$Name)),
                            selected="Pick one"
                       ))
    ),
    
    mainPanel(
      plotOutput("radar")
    )
  )
))
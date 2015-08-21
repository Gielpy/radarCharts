#ui.R

library(shiny)

shinyUI(fluidPage(
  titlePanel("The Modern Toolbox"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Create radar charts of baseball players and teams."),
      
      radioButtons("radio", label = h3("Radio buttons"),
                   choices = list("Pitchers" = 1, "Hitters" = 2), 
                   selected = 1),
      
      selectInput("var",
                  label="Choose a pitcher",
                  choices=c(levels(pitchers.sorted$Name)),
                  selected="Pick one"
      )
    ),
    mainPanel(
      plotOutput("radar"),
      textOutput("text1")
    )
  )
))


library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Forecasting for Air Quality Measurements"),
  sidebarPanel(
    selectInput("vari", "Variable:",
                c("Ozone","Solar.R","Wind","Temp")),
    checkboxInput("Prediction", "With Prediction", FALSE)
    
  ),
  mainPanel(
    h3(textOutput("title")),
    plotOutput("tsPlot"),
    verbatimTextOutput("fit")
    
  )
))
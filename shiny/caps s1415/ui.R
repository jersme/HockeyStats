# ui

library(shiny)

source("helper.R")

# Define UI
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Capitals Regular Season 14-15 Stats"),
  
  # Sidebar with a slider input
  sidebarPanel(
    selectInput("caps.player.select", 
                "Select a player", 
                distinct(select(shots, player))),
    checkboxInput("shot.type", "Show shot types", value = FALSE)
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    
    plotOutput(outputId = "shot_plot", width = 600, height = 300),
    
    plotOutput(outputId = "shot_plot_half", width = 300, height = 300)
    
  )
))
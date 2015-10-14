# server

source("helper.R")

library(shiny)

shinyServer(function(input, output) {
  
  output$shot_plot <- renderPlot({
    
    ## create the ice rink background image
    g <- rasterGrob(readPNG("fullrink.png"), interpolate=TRUE)
    
    p.shots <-  ggplot(filter(shots, player == input$caps.player.select)) +
      annotation_custom(g, xmin = -100, xmax = 100, ymin = -50, ymax = 50) +
      scale_x_continuous(limits = c(-110, 110)) +
      scale_y_continuous(limits = c(-50, 50)) +
      geom_point(aes(newxc, newyc)) +
      theme(panel.background = element_blank(),
          axis.line=element_blank(),
          axis.text.x=element_blank(),
          axis.text.y=element_blank(),
          axis.ticks=element_blank(),
          axis.title.x=element_blank(),
          axis.title.y=element_blank())
    
    
   
    p.shots
    
  })
  
  output$shot_plot_half <- renderPlot({
    
    ## create the ice rink background image
    gh <- rasterGrob(readPNG("halfrink.png"), interpolate=TRUE)
    
    p.shots.half <-  ggplot(filter(shots, player == input$caps.player.select)) +
      annotation_custom(gh, xmin = -100, xmax = 0, ymin = -50, ymax = 50) +
      scale_x_continuous(limits = c(-100, 0)) +
      scale_y_continuous(limits = c(-50, 50)) +
      geom_point(aes(newxc.hf, newyc.hf)) +
      theme(panel.background = element_blank(),
            axis.line=element_blank(),
            axis.text.x=element_blank(),
            axis.text.y=element_blank(),
            axis.ticks=element_blank(),
            axis.title.x=element_blank(),
            axis.title.y=element_blank())
    
    
    
    p.shots.half
    
  })
  
})
#Chess
#library(shiny)
#library(lessR)
#library(ggplot2)
#library(tidyverse)
#library(reshape2)

d <- read.csv('data/filtereddata.csv')

#shinyServer(function(input, output) {
#  output$myPlot <- renderPlot({
 #                           #' Histogram for # of turns
#                           Histogram(turns, data=d, bin.width=input$MyWidth,quiet = TRUE, xlab="Number of Turns", ylab="Count of Games")
#  })
#})
#######################################################################################
library(ggplot2)
library(shinyBS)
library("MASS")
library(ggplot2)
library(methods)
library(hexbin)

d <- read.csv('data/filtereddata.csv')

function(input, output, session){
  
#############################
  #'Histogram
#############################
  
  observeEvent(input$link_to_tabpanel_geom_histogram, {
    newvalue <- "geom_histogram"
    updateNavbarPage(session, "main", newvalue)
  })
  #############################
  #' # of turns
  #############################
  
  output$plot_geom_histogram <- renderPlot({
    ggplot(d, aes(turns)) + geom_histogram(alpha = input$geom_histogram_element1, 
                                             color = input$geom_histogram_element2, 
                                             fill = input$geom_histogram_element3,
                                             linetype = input$geom_histogram_element4,
                                             size = input$geom_histogram_element5,
                                             binwidth  = input$geom_histogram_element6) +
   xlab("Number of Turns") + ylab("Count of Games") + labs( subtitle = "Identify the length of a normal game")    
  })
  
  output$geom_histogram_text <- renderText({
    paste('ggplot(d, aes(turns)) + \n geom_histogram(alpha = ',input$geom_histogram_element1,',\n color = "',input$geom_histogram_element2,'",\n fill = "',input$geom_histogram_element3,'",\n linetype = "',input$geom_histogram_element4,'",\n size = ',input$geom_histogram_element5,',\n binwidth = ',input$geom_histogram_element6, ')',sep='' )
  })
  
  output$geom_histogram_table <- renderTable({
    head(d)
  })
  
  #############################
  #'Bar Chart  
  observeEvent(input$link_to_tabpanel_geom_bar, {
    newvalue <- "geom_bar"
    updateNavbarPage(session, "main", newvalue)
  })

  output$plot_geom_bar <- renderPlot({
    ggplot(d, aes(shortname)) + geom_bar(
                                              alpha    = input$geom_bar_element1, 
                                              color    = input$geom_bar_element2, 
                                              fill     = input$geom_bar_element3,
                                              linetype = input$geom_bar_element4,
                                              size     = input$geom_bar_element5,
                                              width    = input$geom_bar_element6) +  
      scale_x_discrete(labels = abbreviate) + theme(axis.text.x = element_text(angle=45,  hjust=1)) +
      #coord_flip() +
      xlab("Openings") + ylab("Count of Games")
    
    
  })
  output$geom_bar_text <- renderText({
    paste('ggplot(d, aes(shortname)) + \n  geom_bar(alpha = ',input$geom_bar_element1,',\n color = "',input$geom_bar_element2,'",\n fill = "',input$geom_bar_element3,'",\n linetype = "',input$geom_bar_element4,'",\n size = ',input$geom_bar_element5,',\n width = ',input$geom_bar_element6, ')',sep='' )
  })
  
  output$geom_bar_table <- renderTable({
    head(d)
  })
  
  
  
}






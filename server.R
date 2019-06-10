#Chess
library(shiny)
library(lessR)
library(ggplot2)
library(tidyverse)
library(reshape2)

d <- read.csv('data/filtereddata.csv')


shinyServer(function(input, output) {
  output$myPlot <- renderPlot({
                            #' Histogram for # of turns
                           Histogram(turns, data=d, bin.width=input$MyWidth,quiet = TRUE, xlab="Number of Turns", ylab="Count of Games")
  })
  
})
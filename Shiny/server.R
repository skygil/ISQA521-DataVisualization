library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$distPlot <- renderPlot({

        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')

    })

})

library(shiny)
library(tidyverse)
library(reshape)
library(lessR)

d <- read.csv('data/Cars.csv')

shinyServer(function(input, output) {
    output$myPlot <- renderPlot({
        ggplot(d, aes(MPGcity, color=Source, fill=Source)) +
            geom_histogram(position="identity", binwidth=input$MyWidth, alpha=0.35) + 
            xlab("MPG City") + ylab("Country") + 
            labs(title = "Overlapping Histograms in ggplot2", subtitle = "Histograms for USA and Non-USA cars")
        
        
        
        
    })
    
})

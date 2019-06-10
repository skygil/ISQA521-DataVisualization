library(shiny)
library(lessR)
library(ggplot2)
library(tidyverse)
library(reshape2)


shinyUI(fluidPage(
    titlePanel("Select Bin Width"),
    sidebarLayout(
        sidebarPanel(
            sliderInput(inputId = "MyWidth", # Input: Slider for the number of bins
                        label = "Bin Width:",
                        min = 1, max = 100, value = 15)
        ),
        mainPanel(
            plotOutput(outputId = "myPlot") # Output: Histogram
        )
    )
))







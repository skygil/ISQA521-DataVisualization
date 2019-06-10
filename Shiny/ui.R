#' Bin width 100
#' 20 bins
#' 88 outliers
#' LessR hs code for white players: Histogram(white_rating, data=filtereddata, fill="lightgray", quiet=TRUE, xlab="White Player's Rating", ylab="Count of Games")
#' LessR hs code for black players: Histogram(black_rating, data=filtereddata, fill="black", quiet=TRUE, xlab="Black Player's Rating", ylab="Count of Games")



library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Chess"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot")
        )
    )
))


library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Select Bin Width"),
    
    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput(inputId = "MyWidth", # Input: Slider for the number of bins
                        label = "Bin Width:",
                        min = 1, max = 8, value =4)
        ),
        mainPanel(
            plotOutput(outputId = "myPlot") # Output: Histogram
        )
    )
))


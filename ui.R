shinyUI(
    
    navbarPage(
        header = '',
        id = 'main',

#############################
 #' Headings/Titles 
#############################

        title = "The Game of Chess",
        tabPanel('home', fluidRow(title = '', width = 12,  align = "center", 
                
#############################
 #' Introduction    
#############################

                tags$body(tags$p(style = "padding: 30px; width:822px",align = 'left',h1("The Game of Chess"), h4("By: Jordan Hilton and Skye Gilbreth"), tags$br(), tags$br(), h2("Welcome!"),
                        tags$br(),h5("If you are new to the world of chess, or just generally like to nerd out on a statistical analysis from our dataset, then you are in the right place!") ,
                        tags$br(),'This app was developed to meet the requirements for the final class project in ISQA 521: Analytics Communication and Management. This course took place through the ', tags$a('School of Business,',target="_blank" ,href='https://www.pdx.edu/sba/'), 'at', tags$a('Portland Statue University.',target="_blank" ,href='https://www.pdx.edu/' ),tags$br(),tags$br(),'The main R package we used to write this code, was', tags$a('ggplot2.',target="_blank", href='http://ggplot2.org/'), tags$br(),'The output code listed under each graph, on their own individual pages, will show you the output in ggplot2. This code can be copied and pasted into R. In order for this code to work appropriately, you will need to change your dataset, and your variables. In otherwords, view this code as mostly an example of what to expect when writing something similiar in R and more as code you can take and manipulate.',
                        tags$br(),'If you are interested in learning more about this project, you can view the data by heading over to this unique ', tags$a('Github',target="_blank" ,href='https://github.com/lykouragh/ISQA521'), ' address.'
                                           )
                                    ),
        

#########################################################################
 #' Create Table for Pictures/Links to the Histogram and Bar graphs 
#########################################################################

                tags$table(
                    tags$tr(tags$td( colspan = 3 ,align = "center" ,tags$table(tags$tr(tags$td(tags$span( style = "font-size:200%", 'Graphs:')))) )),
                    tags$tr(tags$td( tags$tr(tags$td(actionLink("link_to_tabpanel_geom_histogram",tags$img(src = 'geom_histogram.png'))), tags$td(actionLink("link_to_tabpanel_geom_bar",tags$img(src = 'geom_bar.png')))),
                                     tags$tr(tags$td(align = "center",tags$span('Histogram')), tags$td(align = "center",tags$span('Bar Chart'))) ))
                    
                ) #' End of Tags Table
            ) #' End of Fluid Row
        ), #' End of tab panel

##############################
 #' Navigation to Subpages
##############################
        
#' Navbars    
        navbarMenu(
            "Graphs",
            
##################################
 #' Histogram Panel (Design View)
#################################

            tabPanel(
                'Histogram',
                value = 'geom_histogram',   
                
                sidebarLayout(
                    position = "left",
                    
                    sidebarPanel(
                        "Aesthetics",
                        width = 4,
                        
                        sliderInput(
                            'geom_histogram_element1', 
                            label='alpha', 
                            min = 0 , 
                            max = 1, 
                            value = 1, 
                            step = 0.1),
                        
                        selectInput(
                            'geom_histogram_element2', 
                            label = 'color', 
                            choices = c('darkblue','grey35','red','#add8e6','green','blue','yellow'),
                            selected = 'grey35'),
                        
                        selectInput(
                            'geom_histogram_element3', 
                            label = 'fill', 
                            choices = c('white','#138D75', 'grey','black','orange','grey35'),
                            selected = 'grey35'),
                        
                        selectInput(
                            'geom_histogram_element4', 
                            label = 'linetype', 
                            choices = c("blank", "solid", "dashed", "dotted", "dotdash", "longdash","twodash"),
                            selected = 'solid'),
                        
                        sliderInput(
                            'geom_histogram_element5', 
                            label='size', 
                            min = 0.1 , 
                            max = 3, 
                            value = 0.5, 
                            step = 0.5),
                        
                        sliderInput(
                            'geom_histogram_element6'
                            , label='binwidth'
                            , min = 1 
                            , max = 100
                            , value = 15
                            , step = 0.1),
                        
                        checkboxInput(
                            inputId = "geom_histogram_table",
                            label  = strong("Show data"),
                            value  = TRUE),
                        
                        checkboxInput(
                            inputId = "geom_histogram_text",
                            label   = strong("Show ggplot function"),
                            value   = FALSE)
                    ),
                    
                    mainPanel(
                        "Game Length", 
                        width = 8,
                        
                        fluidRow(
                            style = "padding-right: 10px;",
                            splitLayout(plotOutput('plot_geom_histogram'))
                        ),
                        
                        conditionalPanel(
                            condition = "input.geom_histogram_table == true",
                            
                            fluidRow(
                                style = "padding-right: 10px;",
                                tableOutput("geom_histogram_table")
                            )
                        ),
                        
                        conditionalPanel(
                            condition = "input.geom_histogram_text == true",
                            fluidRow(
                                style = "padding-right: 20px;",
                                textOutput("geom_histogram_text", container = pre)
                            )
                        )
                    ) #' End of main panel
                ) #' End of sidebar layout
            ), #' End of tab panel
            
#############################
 #' Bar Chart Panel
#############################

            tabPanel(
                'Bar Chart',
                value = 'geom_bar',   
                
                sidebarLayout(
                    position = "left",
                    
                    sidebarPanel(
                        "Aesthetics",
                        width = 4,
                        
                        sliderInput(
                            'geom_bar_element1', 
                            label='alpha', 
                            min = 0 , 
                            max = 1, 
                            value = 1, 
                            step = 0.1),
                        
                        selectInput(
                            'geom_bar_element2', 
                            label = 'color', 
                            choices = c('darkblue','grey35','red','#add8e6','green','blue','yellow'),
                            selected = 'grey35'),
                        
                        selectInput(
                            'geom_bar_element3', 
                            label = 'fill', 
                            choices = c('white','#138D75', 'grey','black','orange','grey35'),
                            selected = 'grey35'),
                        
                        selectInput(
                            'geom_bar_element4', 
                            label = 'linetype', 
                            choices = c("blank", "solid", "dashed", "dotted", "dotdash", "longdash","twodash"),
                            selected = 'solid'),
                        
                        sliderInput(
                            'geom_bar_element5', 
                            label='size', 
                            min = 0.1 , 
                            max = 3, 
                            value = 0.5, 
                            step = 0.5),
                        
                        sliderInput(
                            'geom_bar_element6'
                            , label='binwidth'
                            , min = 1 
                            , max = 25
                            , value = 1.5
                            , step = 0.1),
                        
                        checkboxInput(
                            inputId = "geom_bar_table",
                            label  = strong("Show data"),
                            value  = TRUE),
                        
                        checkboxInput(
                            inputId = "geom_bar_text",
                            label   = strong("Show ggplot function"),
                            value   = FALSE)
                    ),
                    
                    mainPanel(
                        "Frequency of Openings", 
                        width = 8,
                        
                        fluidRow(
                            style = "padding-right: 10px;",
                            splitLayout(plotOutput('plot_geom_bar'))
                        ),
                        
                        conditionalPanel(
                            condition = "input.geom_bar_table == true",
                            
                            fluidRow(
                                style = "padding-right: 10px;",
                                tableOutput("geom_bar_table")
                            )
                        ),
                        
                        conditionalPanel(
                            condition = "input.geom_bar_text == true",
                            fluidRow(
                                style = "padding-right: 20px;",
                                textOutput("geom_bar_text", container = pre)
                            )
                        )
                    ) #' End of main panel
                ) #' End of sidebar layout
            ) 

#############################
 #' End of tab panel
##############################
            
        ) #' End of NavBar Menu
    ) #' End of Page
 )#' End of App









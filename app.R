#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)


ui <- navbarPage(
    "Milestone 3",
    tabPanel("Potential Data Sources",
             titlePanel("Potential Data Sources"),
             p("I'm planning to use Census Data that has variables describing educational attainment by county and state. I'm also planning to use the open-source data from Carnegie Mellon's Delphi Research Group that includes Covid behavior data, like mobility based on cell phones, mask usage, dining out, etc")),
    tabPanel("About", 
             titlePanel("About"),
             h3("Project Background and Motivations"),
             p("https://github.com/SarahBrashear/milestone3")),
    tabPanel("Doing Something with Data", 
             titlePanel("Doing Something with Data"),
             h3("Project Background and Motivations"),
             p("This is text above my plot"),
             plotOutput("distPlot")))
            

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)

#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Avocado Prices"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            
        textInput("boslas","Enter number of total bags",value="1000"),
        submitButton(text="submit")
       
           
            
        ),

        # Show a plot of the generated distribution
        mainPanel(
            h1("Plot of avocado prices"),
            plotOutput("distPlot"),
            h3("The average price for your total bags is: "),
            textOutput("out1")
        )
    )
))

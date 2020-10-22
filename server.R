#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    # Start of calculation
    library(ggplot2)
    df<- read.csv("avocado.csv")
    fit <- lm(AveragePrice ~ Total.Volume,data=df)
    precio<- reactive({
        
        entrada <- as.numeric(input$boslas)
        predict(fit,newdata=data.frame(Total.Volume=entrada))
        
        })
    
    output$out1 <- renderText({precio()})
    output$distPlot <- renderPlot({

        # generate bins based on input$bins from ui.R
          ggplot(data=df,aes(x=Total.Volume,y=AveragePrice))+geom_point()+
            geom_smooth(method="lm",formula= y~x)+geom_point(aes(x = as.numeric(input$boslas),precio()),color="red",size=3)
        
        

    })

})

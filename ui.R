#ui.R

library(shiny)

library(cluster.datasets)

library(ggplot2)

data(olympic.track.1896.1964)

fluidPage(
        
        titlePanel("Olympic Track Times from 1896 to 1964"),
        
        # Copy the line below to make a set of radio buttons
        radioButtons("meters", label = h3("Choose Meters"),
                     choices = list("100 m" = 2, "200 m" = 3, "400 m" = 4, "800 m" = 5, "1500 m" = 6, "5000 m" = 7, "10000 m" = 8), 
                     selected = 2),
        
        hr(),
        
        plotOutput("value")
        
)


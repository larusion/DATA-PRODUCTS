#ui.R

library(shiny)



shinyUI(pageWithSidebar(
        headerPanel("Olympic Track Times from 1896 to 1964"),
        sidebarPanel(
                radioButtons("meters", label = h3("Choose Meters"),
                             choices = list("100 m" = 2, "200 m" = 3, "400 m" = 4, "800 m" = 5, "1500 m" = 6, "5000 m" = 7, "10000 m" = 8), 
                             selected = 2),
                submitButton("Plot", icon = icon("bar-chart-o"))
        ),
        mainPanel(
                plotOutput("value")
        )
))
#ui.R

library(shiny)



shinyUI(
        
        pageWithSidebar(
                
        headerPanel("Olympic Track Times from 1896 to 1964"),
        
        sidebarPanel(
                
                tags$h2("Description"),
                
                tags$h5("This app displays the olympic track times in tenths of a second versus over the years that they were recorded, i.e., from 1896 to 1964. The user needs to choose the meters that the athletes ran. Click the Plot button to plot. If you would like to download, please click the Download button."),
                
                tags$h5("This dataset comes from Package 'cluster.datasets' of CRAN. References : Hartigan, J. A. (1975). Clustering Algorithms, John Wiley, New York."),
                
                #radioButtons("meters", label = h3("Choose Meters"),
                #             choices = c("100 m" = 2, "200 m" = 3, "400 m" = 4, "800 m" = 5, "1500 m" = 6, "5000 m" = 7, "10000 m" = 8), selected = 2),
                
                
                radioButtons("meters", label = h3("Choose Meters"),
                             choices = c("100 m", "200 m", "400 m", "800 m", "1500 m", "5000 m", "10000 m")),
                             
          
        
                submitButton("Plot", icon = icon("bar-chart-o")),
                
                tags$br(),
                
                downloadButton('downloadData', 'Download')
                
        ),
        
        mainPanel(
                
                plotOutput("value")
        )
)
)


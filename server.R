# server.R

library(shiny)

library(cluster.datasets)

library(ggplot2)



data(olympic.track.1896.1964)

shinyServer(
        
function(input, output){
        
        # You can access the values of the widget (as a vector)
        # with input$meters, e.g.
        
        datasetInput <- reactive({
                switch(input$meters,
                       "100 m" = 2, 
                       "200 m" = 3, 
                       "400 m" = 4, 
                       "800 m" = 5, 
                       "1500 m" = 6, 
                       "5000 m" = 7, 
                       "10000 m" = 8)
        })
        
        
        
        output$value <- renderPlot({ 
              
                g <- ggplot(olympic.track.1896.1964, aes(olympic.track.1896.1964[, 1], olympic.track.1896.1964[, datasetInput()]))
                
                g <- g + geom_point() + labs(title = "Olympic Track Times") + 
                        labs(x = "YEAR", y = paste("Winning Time in the", input$meters))
                
                print(g)
                
                #ggplotly(p)
                
        })
                
        
        
        
        output$downloadData <- downloadHandler(
                
                        filename = function() { 
                                paste(input$meters, '.pdf', sep = '') 
                        },
                        
                        content = function(file) {
                                pdf(file)
                                
                                g <- ggplot(olympic.track.1896.1964, aes(olympic.track.1896.1964[, 1], olympic.track.1896.1964[, datasetInput()]))
                                
                                g <- g + geom_point() + labs(title = "Olympic Track Times") + 
                                        labs(x = "YEAR", y = paste("Winning Time in the", input$meters))
                                
                                print(g)
                                
                                dev.off()
                        }
                )
                
})
        
        
        



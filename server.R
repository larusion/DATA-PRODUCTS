# server.R

library(shiny)

library(cluster.datasets)

library(ggplot2)

data(olympic.track.1896.1964)

function(input, output){
        
        # You can access the values of the widget (as a vector)
        # with input$meters, e.g.
        
        
        output$value <- renderPlot({ 
                
                g <- ggplot(olympic.track.1896.1964, aes(olympic.track.1896.1964[, 1], olympic.track.1896.1964[, as.integer(input$meters)]))
                
                g + geom_point() + labs(title = "Olympic Track Times") + 
                        labs(x = "YEAR", y = paste("Winning Time in the", strsplit(colnames(olympic.track.1896.1964)[as.integer(input$meters)], "\\.")[[1]][2]))
                
        })
        
        
        
}


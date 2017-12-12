#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

###library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$plot1 <- renderPlot({
    req(input$file1)
    file11 = read.csv(input$file1$datapath)
    par(mfrow=c(1,2))
    
    if (input$disc == "fivedisc")
      { file11 <- subset(file11, Store < 5)
      plot(file11$Display, file11$Sales, xlab = "Ailes", ylab="Units Sold", ylim=c(140, 280))
      plot(file11$Display, file11$Price, xlab = "Ailes", ylab="Price", ylim=c(7, 10))
      }
    
    if (input$disc == "tendisc")
    { file11 <- subset(file11, Store > 4 & Store < 9)
      plot(file11$Display, file11$Sales, xlab = "Stores", ylab="Sales", ylim=c(140, 280))
      plot(file11$Display, file11$Price, xlab = "Ailes", ylab="Price", ylim=c(7, 10))
    }
    
    if (input$disc == "fifteendisc")
    { file11 <- subset(file11, Store >= 9)
    plot(file11$Display, file11$Sales, xlab = "Stores", ylab="Sales", ylim=c(140, 280))
    plot(file11$Display, file11$Price, xlab = "Ailes", ylab="Price", ylim=c(7, 10))
    }
    
    output$Items <- renderText({mean(file11$Sales)})
    output$price <- renderText({mean(file11$Price)})
    })
  
})
  

##install.packages("shiny")
##library(shiny)
##install.packages(rsconnect)
##library(rsconnect)

##setwd("C:/Users/Sudhakar/Downloads")
options(shiny.sanitize.errors = F)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Groceries Sale Trends"),
  
  sidebarLayout(
    sidebarPanel(
      fileInput("file1", "Select the Groceries file", 
                accept=c(".csv")),
       
      radioButtons("disc", " % Discounts",
                   choices= c( Five = "fivedisc", 
                               Ten = "tendisc",
                               Fifteen = "fifteendisc"),
                   selected="fivedisc"),  
      
      tags$div(class="header", checked=NA,
               tags$p("Select the discount percentage to see how the sales happened
                     in those stores whch provided the selected discount")
               )
            ),
    
    # Show a plot of the generated distribution
    mainPanel(
       h3("Items sold across the Aisls in various stores"),
       plotOutput("plot1"),
       h3("Average Items Sold: "),
       textOutput("Items"),
       h3("Average Price"),
       textOutput("price"),
       
       tags$div(class="header", checked=NA,
                tags$p("This research demonstrates the sales took place in various Aisls 
                       acorss the stores that sold at different discounts"),
                
                tags$p("It is a comparison between the items sold that featured at the end of the Aisls, 
                        middle of the Aisls and those not featured in the stores that offered various discounts")
       )
       )
  )
))

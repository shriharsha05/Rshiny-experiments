library(markdown)
library(shiny)
library(shinythemes)

# Define UI
ui <- fluidPage( theme = shinytheme("yeti"),
navbarPage("HR ANALYTICS",
           tabPanel("My Team",
                    sidebarLayout(
                      sidebarPanel(
                        selectInput("", h4("Branch"), 
                                    choices = list("Unilog Content" = 1, "Unilog Software" = 2), selected = 1),
                        textInput("text", h4("Employee ID"), 
                                    value = "Ex : 100123"),
                        br(),
                        br(),
                        br(),
                        h4("Summary:"),
                        h5("Attrition Prediction: No"),
                        h5("Attrition Probability: 15%"),
                        h5("Designation: Team Lead"),
                        h5("Primary Department: Solution Engineering"),
                        h5("Secondary Department: Solution Enhancement")
                      ),
                      mainPanel(
                      #  fluidRow(
                        #  actionButton("risk", "Risk Assessment"),
                       #   actionButton("mngmnt", "Management Recommendations"),
                      #    actionButton("perf", "Performance")
                       # ),
                        tabsetPanel(
                          tabPanel("Risk Assessment", plotOutput("distPlot")), 
                          tabPanel ( "Management Recommendations", 
                                   br(),
                                   h5("Professional Development Strategy : Retain and Maintain"),
                                   br(),
                                   h5("Work Environment Strategy         : Improve Work-Life Balance"),
                                   br(),
                                   br(),
                                   textAreaInput("notes", h4("Notes:"), value = "", width = "300px", height = "200px"),
                                   actionButton("savenotes", "Save Notes")),
                          tabPanel("Performance", tableOutput("table"))
                        ),
                        br(),
                        br()
                        #dummy graph plot
                        #plotOutput(outputId = "distPlot")
                        
                      )
                    )          
           ),
           tabPanel("Department",
                    h4(""),
                    selectInput("Department","Select Department:",c("Research and development"="RD","Marketing"="mark")),
                    sidebarPanel(
                      plotOutput(outputId = "dist3Plot")
                     
                    ),
                    mainPanel(
                      hr(),
                      br(),
                      br(),
                      #dummy graph plot
                      h4("Hello")
                    )
           ),
           tabPanel("Recruitment Channel Analysis",
                    mainPanel(
                      selectInput("Department","Select Department:",c("Research and development"="RD","Marketing"="mark")),
                      hr(),
                      br(),
                      br(),
                      #dummy graph plot
                      plotOutput(outputId = "dist2Plot")
                    )
           )
)
)

server <- function(input, output, session) {
  
  output$distPlot <- renderPlot({
   
    x    <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = 15)
    
    hist(x, breaks = bins, col = "#75AADB", border = "white",
         xlab = "Waiting time to next eruption (in mins)",
         main = "Histogram of waiting times")
    
  })
  
  output$dist2Plot <- renderPlot({
    
    x    <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = 15)
    
    hist(x, breaks = bins, col = "#75AADB", border = "white",
         xlab = "Waiting time to next eruption (in mins)",
         main = "Histogram of waiting times")
    
  })
  
  output$dist3Plot <- renderPlot({
    
    x    <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = 15)
    
    hist(x, breaks = bins, col = "#75AADB", border = "white",
         xlab = "Waiting time to next eruption (in mins)",
         main = "Histogram of waiting times")
    
  })
  
  output$plot <- renderPlot({
    plot(cars, type=input$plotType)
  })
  
  output$summary <- renderPrint({
    summary(cars)
  })
}

shinyApp(ui = ui, server = server)
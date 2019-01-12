library(shiny)
library(dplyr)
library(shinyjs)
Logged <-  FALSE

shinyServer(function(input, output) {
  
  source('ui1.R') #login page
  source('ui2.R')
  

  
  observeEvent(input$"ui1Output-confirm", {
    Logged <<- T
  })
  
  observe({
    tmp <- input$"ui1Output-confirm"
    if (Logged == FALSE) {
      output$page <- renderUI({ 
        ui1Output('ui1Output') 
      })
      output$lsuId <- renderText({ input$lsuId })
    }
    if (Logged == TRUE) 
    {
      output$page <- renderUI({ ui2 })
    }
  })
  callModule(ui1,'ui1') 
})

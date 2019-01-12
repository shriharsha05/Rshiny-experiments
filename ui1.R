library(shiny)
library(shinyjs)

ui1Output <-  function(id, label = "ui1") {
  ns <- NS(id)
  shinyUI(fluidPage(
    useShinyjs(),
    titlePanel("Form"),
    div(textInput(ns("lsuId"), "This has to be filled", ""),
        actionButton(ns("confirm"), "Submit", class = "btn-primary")
    )
  ))
}

ui1 <- function(input, output, session) {
  observe({
    LSUID <- reactive({ input$lsuId })
    shinyjs::toggleState(id = "confirm", condition = LSUID())
  })
}

library(shiny)

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
source('ui1.R') #login page
source('ui2.R')
source('server.R')

shinyApp(ui = shinyUI, server = shinyServer)
# source("C:/Users/gvign/Desktop/pokemon-indexer/pokemon/Pokemon/mainComponent.R")
library(shiny)

ui <- fluidPage(
  
  # App title ----
  titlePanel("Pokedex v1.0!"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel("sidebar panel"
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel("main panel"
      
    )
  )
)

server <- function(input, output) {

}


shinyApp(ui = ui, server = server)

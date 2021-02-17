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
    mainPanel(
      
      tabsetPanel(
        type = "tabs",
        tabPanel("Home",
                 h1("Welcome!"),
                 h5("This is my version of Pokedex. Made for anyone who wishes to start a new game of pokemon and 
                    see what stats their pokemon are"),
                 h5("Currently all this application can do is print a few fancy graphs :P"),
                 h5("But in the future this app shall do most things you want.")),
        tabPanel("Tools",
                 tabsetPanel(type = "tabs",
                             tabPanel("Compare"))),
        tabPanel("About",
                 p("Made by me :)))))))"))
        
      )
      
    )
  )
)

server <- function(input, output) {

}


shinyApp(ui = ui, server = server)

# source("C:/Users/gvign/Desktop/pokemon-indexer/pokemon/Pokemon/mainComponent.R")
library(shiny)

ui <- fluidPage(
  
  # App title ----
  titlePanel("Pokedex v1.0!"),

  tabsetPanel(
    type = "tabs",
    tabPanel("Home",
             h1("Welcome!"),
             h5("This is my version of Pokedex. Made for anyone who wishes to start a new game of pokemon and 
                see what stats their pokemon are."),
             h5("Currently all this application can do is print a few fancy graphs :P"),
             h5("But in the future this app shall do most things you want.")),
    tabPanel("Basics",
            tabsetPanel(type = "tabs",
                        tabPanel("Types"),
                        tabPanel("Base Stats"),
                        tabPanel("EV/IV"),
                        tabPanel("Items"),
                        tabPanel("Experience"))),
    tabPanel("Tools",
             tabsetPanel(type = "tabs",
                         tabPanel("Compare",
                                  sidebarLayout(
                                    sidebarPanel(
                                      radioButtons("radio", label = h3("Select Pokemon from category"),
                                                   choices = list("Starter Pokemons" = 1, "Normal Pokemons" = 2, "Legendary Pokemons" = 3, "Mega Evolution Pokemons" = 4), 
                                                   selected = 1),
                                      
                                      hr(),
                                    ),
                                    mainPanel("helpful text")
                                  )),
                         tabPanel("Predict"))),
    tabPanel("About",
             p("Made by me :)))))))"))
  )
)

server <- function(input, output) {
  
  output$value <- renderPrint({ input$radio })

}


shinyApp(ui = ui, server = server)

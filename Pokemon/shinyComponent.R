# source("C:/Users/gvign/Desktop/pokemon-indexer/pokemon/Pokemon/mainComponent.R")
library(shiny)
library(shinyjs)
library(shinythemes)
library(shinydashboard)

ui <- fluidPage(
  
  light <- function(){
    theme = shinytheme("cerulean")
  },
  
  dark <- function(){
    theme = shinytheme("darkly")
  },
  
  shinyjs::useShinyjs(),

  fluidRow(
            column(2,
                   # App title ----
                   h1("Pokedex v1.0!")),
            
            column(10, offset = 10,
                  checkboxInput("theme", label = "Dark", value = FALSE)),
           ),

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
                                      radioButtons("PokemonTypeRadio", label = h3("Select Pokemon from category"),
                                                   choices = list("Starter Pokemon" = 1, "Normal Pokemon" = 2, "Legendary Pokemon" = 3, "Mega Evolution Pokemon" = 4), 
                                                   selected = 1),
                                      
                                      checkboxInput("PokemonComparison", label = "Compare Pokemon", value = FALSE),
                                      
                                      selectInput("StarterPokemon", label = h3("Select Pokemon from list"),
                                                  c("1" = "1",
                                                    "2" = "2")
                                                  ),
                                      selectInput("NormalPokemon", label = h3("Select Pokemon from list"),
                                                  c("3" = "1",
                                                    "4" = "2")
                                      ),
                                      selectInput("LegendaryPokemon", label = h3("Select Pokemon from list"),
                                                  c("5" = "1",
                                                    "6" = "2")
                                      ),
                                      selectInput("MegaPokemon", label = h3("Select Pokemon from list"),
                                                  c("7" = "1",
                                                    "8" = "2")
                                      ),
                                      hr()
                                    ),
                                    mainPanel("helpful text")
                                  )),
                         tabPanel("Predict"))),
    tabPanel("About",
             p("Made by me :)))))))"))
  )
)

server <- function(input, output) {
  
  observeEvent(input$PokemonTypeRadio, {
    
    toggle(id = "StarterPokemon", condition = input$PokemonTypeRadio == "1")
    toggle(id = "NormalPokemon", condition = input$PokemonTypeRadio == "2")
    toggle(id = "LegendaryPokemon", condition = input$PokemonTypeRadio == "3")
    toggle(id = "MegaPokemon", condition = input$PokemonTypeRadio == "4")

  })
  
  observeEvent(input$PokemonComparison, {
    
    toggle(id = "StarterPokemon", condition = input$PokemonTypeRadio == "1" && input$PokemonComparison)
    toggle(id = "NormalPokemon", condition = input$PokemonTypeRadio == "2")
    toggle(id = "LegendaryPokemon", condition = input$PokemonTypeRadio == "3")
    toggle(id = "MegaPokemon", condition = input$PokemonTypeRadio == "4")
    
  })
  
  observeEvent(input$theme, {
    
    if (input$theme == "FALSE"){
      light()
    }
    else{
      dark()
    }
    
  })

}


shinyApp(ui = ui, server = server)

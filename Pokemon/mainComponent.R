#open required packages
library(ggplot2)
library(fmsb)
library(tidyverse)
library(grid)
library(gridExtra)
library(plyr)
library(plotrix)
library(compare)

#opening dataset and printing summary of dataset
pokemonData <<- read.csv("C:/Users/gvign/Desktop/pokemon-indexer/pokemon/pokemon_stats.csv", stringsAsFactors = TRUE)

#starter pokemon
starterPokemon <<- list(c("Bulbasaur", "Charmander", "Squirtle", "Chikorita", "Cyndaquil", "Totodile", "Treecko", "Torchic", "Mudkip"
                   , "Turtwig", "Chimchar", "Piplup", "Snivy", "Tepig", "Oshawott", "Chespin", "Fennekin", "Froakie", "Rowlet",
                   "Litten", "Popolio"))
starterPokemon <<- as.data.frame(starterPokemon, col.names = "Name")
starterPokemon <<- match_df(pokemonData, starterPokemon, on = "Name")

#splitting main data of Pokemon into sets based on their evolution to better perform operations on them. Each Pokemon has
#a base form and an evolved form or even 2 evolved forms. Certain Pokemon also have Mega Evolution forms based on X or Y
#evolution  stone.
all_normal <<- subset(pokemonData, pokemonData$Legendary == "FALSE" & !grepl("Mega ", pokemonData$Name, fixed = TRUE))
all_legend <<- subset(pokemonData, pokemonData$Legendary == "TRUE" & !grepl("Mega ", pokemonData$Name, fixed = TRUE))
all_mega <<- subset(pokemonData, grepl("Mega ", pokemonData$Name, fixed = TRUE))

#splitting based on generations 1 through 7
# gen1 <- subset(pokemon_data, pokemon_data$Generation=="1")
# gen2 <- subset(pokemon_data, pokemon_data$Generation=="2")
# gen3 <- subset(pokemon_data, pokemon_data$Generation=="3")
# gen4 <- subset(pokemon_data, pokemon_data$Generation=="4")
# gen5 <- subset(pokemon_data, pokemon_data$Generation=="5")
# gen6 <- subset(pokemon_data, pokemon_data$Generation=="6")
# gen7 <- subset(pokemon_data, pokemon_data$Generation=="7")

typePlot <- function(){

  #plotting basic comparisons of pokemon stats
  #stat comparison of starter pokemon
  ggplot(starterPokemon, aes(x = reorder(Name,Number), y=Total, fill = Type1)) + geom_bar(stat = "identity") + theme(axis.text.x = element_text(angle = 45, hjust = 1))
  
  #distribution of pokemon by type
  type1_poke <- ggplot(data = all_normal, aes(x = Type1, fill = Type1)) + geom_bar() + theme(axis.text.x = element_text(angle = 45, hjust = 1)) + ggtitle("Distribution Based on Type-1") + coord_flip()
  type2_poke <- ggplot(data = all_normal, aes(x = Type2, fill = Type2)) + geom_bar() + theme(axis.text.x = element_text(angle = 45, hjust = 1)) + ggtitle("Distribution Based on Type-2") + coord_flip()
  grid.arrange(type1_poke, type2_poke, ncol = 2)
  
  #single vs dual-type pokemon
  pie3D(c(sum(!is.na(pokemonData$Type1)) ,sum(pokemonData$Type2 != "None")), labels = c("Type 1", "Type 1 and 2"), explode = 0.1, main = "Pokemon of Single and Dual Type nature")

}

#comparison of highest evolution vs mega evolution vs a legendary of the same type.

starterPlot <- function(){
#basic radar plot of pokemon
starterPlot <- as.data.frame(starterPokemon[0:2, 6:11], ncol=  6)

colnames(starterPlot) <- c("HP", "Attack", "Defense", "Sp. Atk", "Sp. Def", "Speed")
rownames(starterPlot) <- c("Bulabasaur", "Charmander")
starterPlot <- rbind( rep(80,6), rep(1,6), starterPlot)

colors_border = c( rgb(0.2,0.5,0.5,0.9), rgb(0.8,0.2,0.5,0.9) , rgb(0.7,0.5,0.1,0.9))
colors_in = c( rgb(0.2,0.5,0.5,0.4), rgb(0.8,0.2,0.5,0.4) , rgb(0.7,0.5,0.1,0.4))

radarchart(starterPlot, axistype = 0, seg = 5,
            
            #custom polygon
            pcol = colors_border , pfcol = colors_in , plwd = 2 , plty = 0,
            
            #custom the grid
            cglcol = "grey", cglty = 1, axislabcol = "grey", caxislabels = seq(0,80,5), cglwd=0.8,
            
            #custom labels
            vlcex=0.8
           
)

#legend
legend(x = 1.5, y = 1, legend = rownames(starterPlot[-c(1,2),]), bty = "n", pch = 20 , col = colors_in , text.col = "black", cex = 1.2, pt.cex = 3)
}

typePlot()
starterPlot()

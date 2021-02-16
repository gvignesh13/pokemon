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
pokemon_data <<- read.csv("C:/Users/gvign/Desktop/pokemon-indexer/pokemon/pokemon_stats.csv", stringsAsFactors = TRUE)
summary(pokemon_data)

#creating independent datasets and cleaning them to remove incorrect values. There are blank values present in the set which
#will be awarded a value of 0 as they cannot be filled with anything else.
#cleaning base dataset
# pokemon_data[,2] <- gsub("^.*?Mega", "Mega", pokemon_data$Name)
# pokemon_data[,2] <- gsub("^.*?Primal", "Primal", pokemon_data$Name)
# pokemon_data[,2] <- gsub("[^A-za-z ]", "", pokemon_data$Name)
# pokemon_data$Type2[is.na(pokemon_data$Type2)] <- "None"
# write.csv(pokemon_data, "C:/Users/gvign/Desktop/pokemon-indexer/pokemon/pokemon_stats.csv")

#starter pokemon
starters <<- list(c("Bulbasaur", "Charmander", "Squirtle", "Chikorita", "Cyndaquil", "Totodile", "Treecko", "Torchic", "Mudkip"
                   , "Turtwig", "Chimchar", "Piplup", "Snivy", "Tepig", "Oshawott", "Chespin", "Fennekin", "Froakie", "Rowlet",
                   "Litten", "Popolio"))
starters <<- as.data.frame(starters, col.names = "Name")
starters <<- match_df(pokemon_data, starters, on = "Name")

#splitting main data of Pokemon into sets based on their evolution to better perform operations on them. Each Pokemon has
#a base form and an evolved form or even 2 evolved forms. Certain Pokemon also have Mega Evolution forms based on X or Y
#evolution  stone.
gen_all_normal <<- subset(pokemon_data, pokemon_data$Legendary=="FALSE" & !grepl("Mega ", pokemon_data$Name, fixed = TRUE))
gen_all_legend <<- subset(pokemon_data, pokemon_data$Legendary=="TRUE" & !grepl("Mega ", pokemon_data$Name, fixed = TRUE))
gen_all_mega <<- subset(pokemon_data, grepl("Mega ", pokemon_data$Name, fixed = TRUE))

#pokemon evolution list. list contains 
# sample1 <<- read.csv("C:/Users/gvign/Desktop/pokemon-indexer/pokemon/e18.csv", stringsAsFactors = FALSE)

#pokemon name comparison
# for (i in sample1$Pokemon){
#   for (j in pokemon_data$Name){
#     if (i==j){
#       NULL
#     }
#   }
# }
# 


#splitting based on generations 1 thorugh 7
# gen1 <- subset(pokemon_data, pokemon_data$Generation=="1")
# gen2 <- subset(pokemon_data, pokemon_data$Generation=="2")
# gen3 <- subset(pokemon_data, pokemon_data$Generation=="3")
# gen4 <- subset(pokemon_data, pokemon_data$Generation=="4")
# gen5 <- subset(pokemon_data, pokemon_data$Generation=="5")
# gen6 <- subset(pokemon_data, pokemon_data$Generation=="6")
# gen7 <- subset(pokemon_data, pokemon_data$Generation=="7")


#plotting basic comparisons of pokemon stats
#stat comparison of starter pokemon
ggplot(starters, aes(x=reorder(Name,Number), y=Total, fill=Type1)) + geom_bar(stat = "identity") + theme(axis.text.x = element_text(angle = 45, hjust = 1))

#distribution of pokemon by type
type1_poke <- ggplot(data= gen_all_normal, aes(x=Type1, fill=Type1)) + geom_bar() + theme(axis.text.x = element_text(angle = 45, hjust = 1)) + ggtitle("Distribution Based on Type-1") + coord_flip()
type2_poke <- ggplot(data= gen_all_normal, aes(x=Type2, fill=Type2)) + geom_bar() + theme(axis.text.x = element_text(angle = 45, hjust = 1)) + ggtitle("Distribution Based on Type-2") + coord_flip()
grid.arrange(type1_poke, type2_poke, ncol=2)

#single vs dual-type pokemon
pie3D(c(sum(!is.na(pokemon_data$Type1)) ,sum(pokemon_data$Type2!="None")), labels = c("Type 1", "Type 1 and 2"), explode = 0.1, main = "Pokemon of Single and Dual Type nature")


#comparison of highest evolution vs mega evolution vs a legendary of the same type.


#basic radar plot of pokemon
radar_plot <- as.data.frame(starters[0:2, 6:11], ncol=  6)

colnames(radar_plot) <- c("HP", "Attack", "Defense", "Sp. Atk", "Sp. Def", "Speed")
rownames(radar_plot) <- c(starters$Name[1], starters$Name[2])
radar_plot <- rbind( rep(80,6), rep(1,6), radar_plot)

colors_border=c( rgb(0.2,0.5,0.5,0.9), rgb(0.8,0.2,0.5,0.9) , rgb(0.7,0.5,0.1,0.9) )
colors_in=c( rgb(0.2,0.5,0.5,0.4), rgb(0.8,0.2,0.5,0.4) , rgb(0.7,0.5,0.1,0.4) )

radarchart( radar_plot, axistype = 0, seg = 5,
            
            #custom polygon
            pcol=colors_border , pfcol=colors_in , plwd=2 , plty=1,
            
            #custom the grid
            cglcol="grey", cglty=1, axislabcol="grey", caxislabels=seq(0,20,5), cglwd=0.8,
            
            #custom labels
            vlcex=0.8 
)

# radarchart(radar_plot, axistype = 1,
#            pcol = rgb(171/255, 57/255, 237/255,0.5), pfcol = rgb(171/255, 57/255, 237/255,0.5), plwd = 4,
#            cglcol="grey", cglty=1, axislabcol="black", caxislabels=seq(0,20,5), cglwd=0.8,
#            vlcex = 0.8)


# downloads and processes al games

## load required libraries
library(nhlscrapr)
library(dplyr)

## load games
all.games <- full.game.database()

these.games <- all.games %>%
  filter(season == "20142015",
         hometeam == "WSH" | awayteam == "WSH")


## download and process all games in season 1415
compile.all.games(new.game.table = these.games, 
                  wait = 0, 
                  rdata.folder = "games/downloads/s1415/caps/input/", 
                  output.folder = "games/downloads/s1415/caps/output/", 
                  verbose = T)

## load data in environment
load("nhlscrapr-probs.RData")

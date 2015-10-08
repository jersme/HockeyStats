# downloads and processes al games

## load required libraries
library(nhlscrapr)
library(dplyr)


## download and process all games in season 1415
compile.all.games(season = "20142015", 
                  rdata.folder = "games/downloads/s1415/", 
                  wait = .5)

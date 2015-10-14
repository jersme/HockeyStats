# setup page

## library
library(dplyr)
library(readr)
library(ggplot2)
library(png)
library(grid)

## load the data
md <- read_csv("md.csv")
roster <- read_csv("roster.csv")

## select shots on goal only
shots <- md %>%
  filter(ev.team == "WSH") %>%
  filter(etype == "SHOT") %>%
  select(ev.player.1, distance, type, newxc, newyc, gcode) %>%
  rename(player.id = ev.player.1)

shots <- na.omit(shots)

## add names to shots database
shots <- left_join(shots, select(roster, player.id, firstlast, pos), by = "player.id") %>%
  rename(player = firstlast)

## correct coordinates for half rink size
shots$newxc.hf <- ifelse(shots$newxc > 0, 
                         shots$newxc.hf <- 0 - shots$newxc, 
                         shots$newxc.hf <- shots$newxc)

shots$newyc.hf <- ifelse(shots$newxc > 0, 
                         shots$newyc.hf <- 0 - shots$newyc, 
                         shots$newyc.hf <- shots$newyc)







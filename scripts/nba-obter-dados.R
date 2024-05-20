library(tidyverse)
#devtools::install_github("abresler/nbastatR")
library(nbastatR)
library(lubridate)

setwd("C:/Users/NOTEBOOK CASA/Desktop/NBA_Analytics")
Sys.setenv("VROOM_CONNECTION_SIZE" = 131072 * 2)

# Boxscore Players
stats <- function(data,typeseason){
boxscore_players <- game_logs(seasons = year(data), result_types = "player",
                              season_types = typeseason) %>%
                              filter(dateGame == data)
return (boxscore_players)
}

players <- function(df){
players <- df %>% select(idPlayer,namePlayer) %>% distinct(idPlayer,.keep_all = TRUE) %>%
           rename("idplayer" = "idPlayer", "nameplayer" = "namePlayer")
return (players)
}

teams <- function(df){
teams <- df %>% select(idTeam,nameTeam) %>% distinct(idTeam,.keep_all = TRUE) %>%
         rename("idteam" = "idTeam", "nameteam" = "nameTeam")
return (teams)
}

matches <- function(df){
matches <- df %>% select(idGame,slugSeason,typeSeason,slugMatchup,slugTeam,slugOpponent) %>%
           mutate(idgameteam = paste(idGame,slugTeam,sep="_")) %>%
           select(idgameteam,slugSeason,typeSeason,slugMatchup,slugTeam,slugOpponent) %>%
           distinct(idgameteam, .keep_all = TRUE) %>% rename("slugseason" = "slugSeason", "typeseason" = "typeSeason","slugmatchup" = "slugMatchup",
                                 "slugteam" = "slugTeam", "slugopponent" = "slugOpponent")
return (matches)
}

dates <- function(data_inicial,data_final){
dates <- seq(as.Date(data_inicial),as.Date(data_final), by ="day") %>% format("%Y-%m-%d") %>% as_tibble() %>%
         rename("iddate" = "value")
return (dates)
}

boxscores <- function(df){
boxscores <- df %>% select(idGame,slugTeam,idPlayer,idTeam,dateGame,
                                         minutes, fgm, fga, pctFG, fg2m,fg2a,pctFG2,
                                         fg3m,fg3a,pctFG3, ftm,fta,pctFT,oreb,dreb,treb,
                                         ast,stl,blk,tov,pf,pts,plusminus) %>%
             mutate(idgameteam = paste(idGame,slugTeam,sep = "_"),idgameteamplayer = paste(idGame,slugTeam,idPlayer,sep = "_")) %>%
             select(idgameteamplayer,idgameteam,idPlayer,idTeam,dateGame,
                    minutes, fgm, fga, pctFG, fg2m,fg2a,pctFG2,
                    fg3m,fg3a,pctFG3, ftm,fta,pctFT,oreb,dreb,treb,
                    ast,stl,blk,tov,pf,pts,plusminus) %>%
             rename("idplayer"="idPlayer","idteam"="idTeam","iddate"="dateGame",
                    "min"="minutes","p_fg"="pctFG","p_fg2"="pctFG2","p_fg3"="pctFG3",
                    "p_ft"="pctFT")
return (boxscores)
}

# Obtendo os Dados
df <- stats(Sys.Date()-1,"Regular Season") #Sys.Date() #Regular Season, Playoffs, PlayIn
df_players <- players(df)
df_matches <- matches(df)
#df_teams <- teams(df)
#df_dates <- seq(as.Date("1946-01-01"),as.Date("2099-12-31"), by = "day") %>% format("%Y-%m-%d")
df_boxscores <- boxscores(df)

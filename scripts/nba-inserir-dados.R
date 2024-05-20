library(DBI)
library(tidyverse)

estabelecer_conexao_bd <- function(){
  con <- dbConnect(RPostgres::Postgres(), dbname = "teste_dados_r",
  				 host = "localhost", port = "5432",
  				 user = "postgres", password = "admin")
}

inserir_dados_players <- function(df,con){
  all_players <- dbGetQuery(con, "SELECT * FROM dimplayers")
  df$idplayer <- as.character(df$idplayer)
  df <- df %>% anti_join(all_players)

  if (nrow(df) > 0) {
    dbWriteTable(conn = con, name = "dimplayers", value = df,
                                  row.names = FALSE, overwrite = FALSE, append = TRUE)
    cat("Dados inseridos com sucesso.")} else {cat("Nenhum novo registro de jogador. Nenhum dado inserido")}
}


inserir_dados_matches <- function(df,con){
  all_matches <- dbGetQuery(con, "SELECT * FROM (SELECT *, ROW_NUMBER() OVER () AS row
    						FROM dimmatches) sub ORDER BY row DESC LIMIT 1000")
  df <- df %>% anti_join(all_matches)

  if (nrow(df) > 0) {
    dbWriteTable(conn = con, name = "dimmatches", value = df,
                                  row.names = FALSE, overwrite = FALSE, append = TRUE)
    cat("Dados inseridos com sucesso.")} else {cat("Nenhuma nova partida. Nenhum dado inserido")}
}


inserir_dados_boxscores <- function(df,con){
  all_boxscores <- dbGetQuery(con, "SELECT * FROM (SELECT *, ROW_NUMBER() OVER () AS row
    						FROM factboxscores) sub ORDER BY row DESC LIMIT 1000")
  df$idplayer <- as.character(df$idplayer)
  df$idteam <- as.character(df$idteam)
  df <- df %>% anti_join(all_boxscores)

  if (nrow(df) > 0) {
    dbWriteTable(conn = con, name = "factboxscores", value = df,
                                  row.names = FALSE, overwrite = FALSE, append = TRUE)
    cat("Dados inseridos com sucesso.")} else {cat("Nenhuma nova partida. Nenhum dado inserido")}
}


# Inserindo os dados
con <- estabelecer_conexao_bd()

#inserir datas
#dbWriteTable(conn = con, name = "dimdate", value = datas,
             #row.names = FALSE, overwrite = FALSE, append = TRUE)

#inserir teams
#dbWriteTable(conn = con, name = "dimteams", value = df_teams,
             #row.names = FALSE, overwrite = FALSE, append = TRUE)

inserir_dados_players(df_players,con)
inserir_dados_matches(df_matches,con)
inserir_dados_boxscores(df_boxscores,con)
dbDisconnect(con)

# NBA_Analytics

![pipeline](https://github.com/viniciusbelchior0/NBA_Analytics/blob/main/references/diagrama_nba-analytics.png)

Este projeto visa analisar o desempenho dos jogadores da NBA ao longo de várias temporadas, coletando dados de jogos e estatísticas por meio de web scraping. O objetivo é fornecer informações e gerar insights e recomendações estratégicas para melhorar o desempenho das equipes.

## Explicação

Os dados são coletados através da linguagem `R`, transformando e armazenados em um banco de dados `PostgreSQL`. Para a construção desse BD, foi utilizada a modelagem dimensional(*star-schema*) para criação das tabelas dimensão: players,teams,dates e matches, e da tabela fato: boxscore.

Esses dados são coletados e inseridos diariamente (enquanto a temporada durar).

## Análises

# NBA_Analytics

## 1. Descrição

Este projeto tem por objetivo a criação de uma rotina automatizada para coleta e inserção de dados das partidas da liga norte-americana de basquete, a NBA. Através da utilização de ferramentas de análise de dados, os resultados das partidas são coletados automaticamente e inseridos em um Banco de Dados. Essa abordagem tem por vantagem a automação de tarefas manuais e a garantia de padronização e integridade das informações. Com um repositório de dados contendo as estatísticas básicas de cada jogador, por partida, teremos a disponibilização de uma amostragem significativa de dados para a geração de informações e insights para análise de desempenho e direcionamento de estratégias de jogo.

Os dados são coletados através da linguagem `R`, transformados e armazenados em um banco de dados `PostgreSQL`, modelado através da abordagem dimensional(*Star-schema*). Esses dados são coletados, através do endereço oficial da NBA por meio de uma biblioteca de códigos abertos *nbastatR*, e inseridos no banco de dados; esse ciclo é repetido diariamente, durante a duração de cada temporada.


**Entregáveis**:
- Scripts coleta e ingestão de dados (*Pipeline* de dados).
- Elaboração de Banco de Dados para armazenamento das informações (*Data Warehouse*).
- Relatórios para visualização e análise de dados (*Dashboards*).

**Status do projeto**:
- **Etapas concluídas**: códigos para coleta e ingestão de dados, códigos para elaboração do banco de dados, prótotipos dos relatórios (dashboards).
- **Futuros desenvolvimentos**: consolidação dos relatórios (dashboards) através da inclusão de novas visualizações, métricas e controles para comparação e análise de resultados.

## 2. Estrutura do Projeto

### 2.1 Fluxograma

![pipeline](https://github.com/viniciusbelchior0/NBA_Analytics/blob/main/references/diagrama_nba-analytics.png)

### 2.2 Stack (tecnologias e ferramentas utilizadas)

- Programação e códigos para coleta de dados: `R` (e biblioteca `nbastatR`[R](https://asbcllc.com/nbastatR/) ).;
- Banco de Dados: `PostgreSQL`;
- Relatórios: `PowerBI` e `Figma` (elaboração da interface do relatório).

### 2.3 Dados

O banco de dados foi criado seguindo a abordagem *Star-schema*, muito utilizada para a elaboração de *Data Warehouses*. A modelagem dimensional divide os dados em tabelas dimensão - que contêm atributos descritivos das entidades - e tabelas fato - que contêm os valores numéricos a respeito dos eventos que serão analisados. Todas as informações estão com seus nomes no idioma original, inglês, devido ao hábito da utilização deste idioma nas principais discussões a respeito da liga. 

Os dados estão disponibilizados em cinco tabelas: *dimDate*, *dimPlayers*, *dimTeams*, *dimMatches* e *factBoxscores*.
- *dimDate*: tabela dimensão contendo informações de datas;
- *dimPlayers*: tabela dimensão contendo informações dos jogadores;
- *dimTeams*: tabela dimensão contendo informações das equipes;
- *dimMatches*: tabela dimensão contendo informações das partidas;
- *factBoxscores*: tabela fato contendo as estatísticas das partidas. Cada linha representa as estatísticas individuais de cada jogador em cada partida.

![banco de dados](https://github.com/viniciusbelchior0/NBA_Analytics/blob/main/modelagem_banco/der_nba.pgerd.png)

### 2.4 Descrição dos Arquivos e Pastas

- dashboard: pasta contendo os arquivos para a elaboração do relatório (dashboard). Possui o relatório elaborado no PowerBI no arquivo `NBA_dashboard.pbix`, e a interface das páginas utilizadas no relatório nos arquivos `nba_*.png`.
- modelagem_banco: pasta contendo os códigos para elaboração do banco de dados. O arquivo `criar_dw_nba.sql` possui o script para criação do banco no Postgres e o arquivo `der_nba.pgerd` contém o diagrama entidade relacionamento, exportado como imagem em `der_nba.pgerd.png`.
- references: pasta contendo informações e referências ao projeto. Possui o diagrama do fluxo do projeto no arquivo `diagrama_nba_analytics.drawio`, exportado como em `diagrama_nba-analytics.png`.
- scripts: pasta contendo os códigos para extração e ingestão dos dados em `nba-obter-dados.R` e `nba-inserir-dados.R`, respectivamente.
- *nba_full.R*: scripts contendo o código para coleta das estatísticas e inserção no banco de dados. Este arquivo é a união dos códigos disponíveis na pasta `scripts`. É o script para ser utilizado em produção.


## 3. Exemplos

![bd](https://github.com/viniciusbelchior0/NBA_Analytics/blob/main/references/bd_screenshot.PNG)
*Exemplo de uma consulta no banco de dados*.

![dashboard](https://github.com/viniciusbelchior0/NBA_Analytics/blob/main/references/dashboard_screenshot.PNG)
*Exemplo de uma página do relatório/dashboard*.

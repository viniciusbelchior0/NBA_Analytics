from airflow import DAG 
from airflow.operators.bash_operator import BashOperator
import pendulum

with DAG(
    "nba_stats",
    start_date=pendulum.datetime(2024, 5, 1, tz="UTC"),
    schedule_interval='0 12 * * *', # executar todos os dias ao meio-dia
) as dag:

    nba_stats = BashOperator(
        task_id = 'nba_stats',
        bash_command = 'Rscript C:/NBA_Analytics/nba_full.R'
    )

    nba_stats 

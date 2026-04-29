from airflow import DAG
from airflow.providers.standard.operators.bash import BashOperator
from datetime import datetime

with DAG(
    dag_id="dbt_pipeline",
    start_date=datetime(2024, 1, 1),
    schedule="@daily",
    catchup=False,
) as dag:

    dbt_run = BashOperator(
    task_id="run_dbt_models",
    bash_command="""
            rm -rf /tmp/dbt_project &&
            git clone https://github.com/sunil3073/food_project_dbt.git /tmp/dbt_project &&
            cd /tmp/dbt_project/food_delivery_dbt &&
            dbt deps &&
            dbt run --profiles-dir /usr/local/airflow/include
            """
)

    dbt_run
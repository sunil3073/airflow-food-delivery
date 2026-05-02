from airflow import DAG
from airflow.providers.bash.operators import BashOperator
from datetime import datetime

REPO_URL = "https://github.com/sunil3073/food_project_dbt.git"
DBT_DIR = "/tmp/dbt_project"

with DAG(
    dag_id="dbt_pipeline_dynamic",
    start_date=datetime(2024, 1, 1),
    schedule="@daily",
    catchup=False,
    tags=["dbt"],
) as dag:

    clone_repo = BashOperator(
        task_id="clone_repo",
        bash_command=f"""
        rm -rf {DBT_DIR} &&
        git clone {REPO_URL} {DBT_DIR}
        """
    )

    dbt_deps = BashOperator(
        task_id="dbt_deps",
        bash_command=f"""
        cd {DBT_DIR} &&
        dbt deps --profiles-dir /usr/local/airflow/include
        """
    )

    dbt_snapshot = BashOperator(
        task_id="dbt_snapshot",
        bash_command=f"""
        cd {DBT_DIR} &&
        dbt snapshot --target dev --profiles-dir /usr/local/airflow/include
        """
    )

    dbt_run = BashOperator(
        task_id="dbt_run",
        bash_command=f"""
        cd {DBT_DIR} &&
        dbt run --target dev --profiles-dir /usr/local/airflow/include
        """
    )

    dbt_test = BashOperator(
        task_id="dbt_test",
        bash_command=f"""
        cd {DBT_DIR} &&
        dbt test --target dev --profiles-dir /usr/local/airflow/include
        """
    )

    clone_repo >> dbt_deps >> dbt_snapshot >> dbt_run >> dbt_test
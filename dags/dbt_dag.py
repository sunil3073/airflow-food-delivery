from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime

REPO_URL = "https://github.com/sunil3073/food_project_dbt.git"
DBT_DIR = "/tmp/dbt_project"
PROFILES_DIR = "/usr/local/airflow/include"

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
        dbt deps
        """
    )

    # ---------- DEV ----------
    dbt_snapshot = BashOperator(
        task_id="dbt_snapshot",
        bash_command=f"""
        cd {DBT_DIR} &&
        dbt snapshot --target dev --profiles-dir {PROFILES_DIR}
        """
    )

    dbt_run_dev = BashOperator(
        task_id="dbt_run_dev",
        bash_command=f"""
        cd {DBT_DIR} &&
        dbt run --target dev --profiles-dir {PROFILES_DIR}
        """
    )

    dbt_test_dev = BashOperator(
        task_id="dbt_test_dev",
        bash_command=f"""
        cd {DBT_DIR} &&
        dbt test --target dev --profiles-dir {PROFILES_DIR}
        """
    )

    # ---------- QA ----------
    dbt_run_qa = BashOperator(
        task_id="dbt_run_qa",
        bash_command=f"""
        cd {DBT_DIR} &&
        dbt run --target qa --profiles-dir {PROFILES_DIR}
        """
    )

    dbt_test_qa = BashOperator(
        task_id="dbt_test_qa",
        bash_command=f"""
        cd {DBT_DIR} &&
        dbt test --target qa --profiles-dir {PROFILES_DIR}
        """
    )

    # ---------- PROD ----------
    dbt_run_prod = BashOperator(
        task_id="dbt_run_prod",
        bash_command=f"""
        cd {DBT_DIR} &&
        dbt run --target prod --profiles-dir {PROFILES_DIR}
        """
    )

    dbt_test_prod = BashOperator(
        task_id="dbt_test_prod",
        bash_command=f"""
        cd {DBT_DIR} &&
        dbt test --target prod --profiles-dir {PROFILES_DIR}
        """
    )

    # ---------- FLOW ----------
    clone_repo >> dbt_deps >> dbt_snapshot \
        >> dbt_run_dev >> dbt_test_dev \
        >> dbt_run_qa >> dbt_test_qa \
        >> dbt_run_prod >> dbt_test_prod
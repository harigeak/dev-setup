from datetime import datetime, timedelta
from airflow import DAG
from airflow.operators.python_operator import PythonOperator

with DAG(
    dag_id="healthcheck",
    start_date=datetime(2026, 1, 1),
    schedule="@daily",
    catchup=False,
    tags=["healthcheck"],
) as dag:

    def ping():
        print("MWAA environment is healthy")

    PythonOperator(task_id="ping", python_callable=ping)

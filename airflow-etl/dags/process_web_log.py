from datetime import timedelta
from airflow.models import DAG
from airflow.operators.bash_operator import BashOperator
from airflow.utils.dates import days_ago

default_args = {
    'owner': 'airflow',
    'start_date': days_ago(0),
    'email': ['your_email_here'],
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}
with DAG(
    'process_web_log',
    default_args=default_args,
    description='ETL Pipeline for Web Server Logs',
    schedule_interval=timedelta(days=1),
    catchup=False,
) as dag:

    # extract ips from access log file
    extract = BashOperator(
        task_id='extract',
        bash_command='grep -oE "^[0-9]+\\.[0-9]+\\.[0-9]+\\.[0-9]+" /opt/airflow/dags/capstone/accesslog.txt > /opt/airflow/dags/capstone/extracted_data.txt'
    )

    # filter out all the occurrences of ipaddress “198.46.149.143” from extracted_data.txt
    transform = BashOperator(
        task_id='transform',
        bash_command='grep -v "198.46.149.143" < /opt/airflow/dags/capstone/extracted_data.txt > /opt/airflow/dags/capstone/transformed_data.txt',
    )

    # archive the file transformed_data.txt into a tar file named weblog.tar
    # use -C to not include the full path in the tar file
    load = BashOperator(
        task_id='load',
        bash_command='tar -cvf /opt/airflow/dags/capstone/weblog.tar -C /opt/airflow/dags/capstone transformed_data.txt'
    )

    # ETL pipeline
    extract >> transform >> load

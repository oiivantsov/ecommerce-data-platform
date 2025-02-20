# https://airflow.apache.org/docs/apache-airflow/stable/security/secrets/fernet.html

from cryptography.fernet import Fernet

fernet_key = Fernet.generate_key()
print(fernet_key.decode())  # your fernet_key, keep it in secured place!
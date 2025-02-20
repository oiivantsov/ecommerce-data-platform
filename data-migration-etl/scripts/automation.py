import mysql.connector
import psycopg2

POSTGRES_CONFIG = {
	'user': 'db_owner',
	'password': '5555',
	'host': 'postgres_server',
	'database': 'sales'
}

MYSQL_CONFIG = {
	'user': 'root',
	'password': '5555',
	'host': 'mysql_server',
	'database': 'sales'
}

# return the last rowid in the sales_data table in the PostgreSql data warehouse
def get_last_rowid():
	try:
		with psycopg2.connect(**POSTGRES_CONFIG) as conn:
			with conn.cursor() as cursor:
				cursor.execute("SELECT MAX(rowid) FROM sales_data")
				row = cursor.fetchone()[0] or 0
				return row
	except mysql.connector.Error as e:
		print(f"Database error occurred: {e}")
	except Exception as e:
		print(f"An error occurred: {e}")

last_row_id = get_last_rowid()
print("Last row id on production datawarehouse = ", last_row_id)

# List out all records in MySQL database with rowid greater than the one on the Data warehouse
def get_latest_records(rowid):
	try:
		with mysql.connector.connect(**MYSQL_CONFIG) as conn:
			with conn.cursor() as cursor:
				cursor.execute("SELECT * FROM sales_data WHERE rowid > %s", [rowid])
				records = cursor.fetchall()
				return records if records else []
	except mysql.connector.Error as e:
		print(f"Database error occurred: {e}")
	except Exception as e:
		print(f"An error occurred: {e}")
		

new_records = get_latest_records(last_row_id)

print("New rows on staging datawarehouse = ", len(new_records))

# Insert the additional records from MySQL into PostgreSql data warehouse.
def insert_records(records):
    try:
        with psycopg2.connect(**POSTGRES_CONFIG) as conn:
            with conn.cursor() as cursor:
                SQL = """
                    INSERT INTO sales_data (rowid, product_id, customer_id, quantity)
                    VALUES (%s, %s, %s, %s)
                """
                cursor.executemany(SQL, records) # bulk insert
                print(f"{cursor.rowcount} records inserted successfully.")
    except psycopg2.Error as e:
        print(f"Database error occurred: {e}")
    except Exception as e:
        print(f"An error occurred: {e}")


insert_records(new_records)
print("New rows inserted into production datawarehouse = ", len(new_records))

# End of program
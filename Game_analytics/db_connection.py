# db_connection.py
import os
from dotenv import load_dotenv
import mysql.connector
from mysql.connector import Error

load_dotenv()

def create_connection():
    try:
        connection = mysql.connector.connect(
            host=os.getenv("DB_HOST", "localhost"),
            user=os.getenv("DB_USER", "root"),
            password=os.getenv("DB_PASS", ""),
            database=os.getenv("DB_NAME", "tennis_analytics"),
            auth_plugin='mysql_native_password'  # if needed on Windows
        )
        if connection.is_connected():
            return connection
    except Error as e:
        print("❌ DB connection error:", e)
        return None

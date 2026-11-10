import pyodbc
import os
from dotenv import load_dotenv

load_dotenv()

def get_connection():
    connection = pyodbc.connect(
        "DRIVER={ODBC Driver 18 for SQL Server};"
        f"SERVER=tcp:{os.getenv('DB_SERVER')};"
        f"DATABASE={os.getenv('DB_NAME')};"
        f"UID={os.getenv('DB_USER')};"
        f"PWD={os.getenv('DB_PASSWORD')};"
        "Encrypt=yes;"
        "TrustServerCertificate=yes;"
        "Connection Timeout=10;"
    )

    return connection


if __name__ == "__main__":
    try:
        conn = get_connection()
        print("SQL Server connection successful!")
        print("Connected database:", conn.execute("SELECT DB_NAME()").fetchone()[0])
        conn.close()

    except Exception as error:
        print("Database connection failed:", error)
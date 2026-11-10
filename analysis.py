
import pandas as pd
from db_connection import get_connection


# Get student records from SQL Server
def load_data():
    conn = get_connection()

    query = """
        SELECT
            s.Student_ID,
            s.Name,
            s.Department,
            s.Gender,
            s.CGPA,
            s.Internship,
            s.Skills,
            p.Status,
            p.Salary
        FROM students s
        LEFT JOIN placements p
            ON s.Student_ID = p.Student_ID
        ORDER BY s.Student_ID
    """

    df = pd.read_sql_query(query, conn)
    conn.close()

    return df


# Calculate placement summary
def get_placement_summary():
    df = load_data()

    total_students = len(df)
    placed_students = len(
        df[df["Status"] == "PLACED"]
    )
    not_placed_students = total_students - placed_students

    placement_percentage = (
        placed_students / total_students * 100
        if total_students > 0 else 0
    )

    return {
        "total_students": total_students,
        "placed_students": placed_students,
        "not_placed_students": not_placed_students,
        "placement_percentage": round(placement_percentage, 2)
    }


# Calculate average CGPA
def get_average_cgpa():
    df = load_data()

    if df.empty:
        return 0

    return round(df["CGPA"].mean(), 2)


# Calculate average salary of placed students
def get_average_salary():
    df = load_data()

    placed = df[df["Status"] == "PLACED"]

    if placed.empty:
        return 0

    return round(placed["Salary"].mean(), 2)

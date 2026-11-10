
from flask import Flask, render_template
from analysis import (
    load_data,
    get_placement_summary,
    get_average_cgpa,
    get_average_salary
)

app = Flask(__name__)


@app.route("/")
def home():
    return render_template("index.html")


@app.route("/dashboard")
def dashboard():
    summary = get_placement_summary()
    average_cgpa = get_average_cgpa()
    average_salary = get_average_salary()

    return render_template(
        "dashboard.html",
        summary=summary,
        average_cgpa=average_cgpa,
        average_salary=average_salary
    )


@app.route("/students")
def students():
    df = load_data()
    student_data = df.to_dict(orient="records")

    return render_template(
        "students.html",
        students=student_data
    )


@app.route("/analysis")
def analysis():
    summary = get_placement_summary()

    return render_template(
        "analysis.html",
        summary=summary
    )


if __name__ == "__main__":
    app.run(debug=True)

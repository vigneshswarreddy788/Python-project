# Student Placement Data Analysis System

## 1. Project Description

The Student Placement Data Analysis System is a web-based application developed using Python, Flask and SQL Server.

The main objective of this project is to analyze student placement information and understand the relationship between academic performance, CGPA, technical skills, internships and placement opportunities.

It helps users understand placement statistics through reports and data visualizations.

## 2. Technologies Used

- **Programming Language:** Python
- **Backend:** Flask
- **Frontend:** HTML, CSS, JavaScript
- **Database:** Microsoft SQL Server
- **Data Analysis:** Pandas, NumPy
- **Data Visualization:** Matplotlib, Seaborn

## 3. Main Features

- Student placement analysis
- Placement rate calculation
- Department-wise placement reports
- Package analysis
- Technical skill demand analysis
- Role analysis
- Department-wise package analysis
- Data visualization

## 4. Project Structure

```text
Student_Placement_website/
│
├── app.py
├── analysis.py
├── db_connection.py
├── database.sql
├── SELECT.sql
├── requirements.txt
├── .gitignore
│
├── static/
│
├── templates/
│
└── README.md
```

## 5. Installation and Setup

### Step 1: Clone the repository

```bash
git clone https://github.com/ambatipraneetha17-ux/Student-Placement-Data-Analysis.git
```

### Step 2: Open the project folder

```bash
cd Student-Placement-Data-Analysis
```

### Step 3: Create a virtual environment

```bash
python3 -m venv venv
```

### Step 4: Activate the virtual environment

For macOS:

```bash
source venv/bin/activate
```

### Step 5: Install dependencies

```bash
pip install -r requirements.txt
```

### Step 6: Database Configuration

- Install and start Microsoft SQL Server.
- Create the database named `StudentPlacementDB`.
- Execute the `database.sql` script.
- Configure the database connection in `db_connection.py` according to your SQL Server settings.
- Keep database credentials in a local `.env` file. Do not upload passwords or secret keys to GitHub.

### Step 7: Run the application

```bash
python app.py
```

Open the local URL displayed in the terminal in your web browser.

## 6. Expected Outcome

The system provides useful insights into student placement information through analytical reports and visualizations. It helps understand placement trends and the factors associated with placement opportunities.

## 7. Author

Student Placement Data Analysis System

Developed as an academic project.

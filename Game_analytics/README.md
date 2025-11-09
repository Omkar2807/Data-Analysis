roject Title: Tennis Game Analytics Dashboard
 Overview
    This project builds an interactive Streamlit dashboard that visualizes tennis player data, rankings, and competition details using the Sportradar API and MySQL database.

Objectives
    Extract real-time tennis data using API calls.
    Store and manage data in a relational database.
    Build an analytics dashboard to visualize player performance and rankings.
    Provide insights on country-wise representation and leaderboard trends.

Tech Stack
    Frontend: Streamlit
    Backend: Python (requests, pandas, mysql.connector)
    Database: MySQL
    API: Sportradar Tennis API
    Tools: .env, dotenv, GitHub, VS Code

Setup Instructions

    1️ Clone the repo:
    git clone https://github.com/your-username/tennis-game-analytics.git
    cd tennis-game-analytics

    2 Install dependencies:
    pip install -r requirements.txt

    3 Create .env file:
    DB_HOST=localhost
    DB_USER=root
    DB_PASS=your_password
    DB_NAME=tennis_analytics
    SPORTS_API_KEY=your_sportradar_api_key
    BASE_URL=https://api.sportradar.com/tennis/trial/v3/en

    4️ Import SQL tables:
    mysql -u root -p < tennis_data.sql

    5️ Run Streamlit app:
    streamlit run app.py

Features
    Dashboard KPIs: Total Competitors, Countries, Highest Points
    Country-wise Analysis: Players and average ranking points
    Competitor Search: Filter by name, country, rank, and points
    Leaderboards: Top players by points and rank
    SQL Explorer: Run custom read-only queries

Screenshots
1.	Dashboard Overview – Showing all KPI metrics and navigation panels

2.	Leaderboard Section – Top 10 players sorted by points and rank

 

3.	Competitor Search Feature – Screenshot of user searching for a player and viewing detailed information





Insights
    Top-performing countries dominate tennis globally.
    Points distribution indicates strong competition among top 50 players.
    Data visualization helps identify emerging players and top categories.

Contributors
    Your Name (Omkar Jadhav) — Developer & Analyst
    Mentor/Instructor Name — Project Supervisor (optional)
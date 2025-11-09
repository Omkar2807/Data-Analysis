import os
import pandas as pd
import numpy as np
import requests
import mysql.connector
from mysql.connector import Error
from dotenv import load_dotenv
from db_connection import create_connection

# ===============================================
# Load environment variables
# ===============================================
load_dotenv()
API_KEY = os.getenv("SPORTS_API_KEY")
BASE_URL = "https://api.sportradar.com/tennis/trial/v3/en"

# ===============================================
# Generic API fetch helper
# ===============================================
def fetch_json(endpoint):
    """Fetch JSON data from Sportradar API"""
    url = f"{BASE_URL}/{endpoint}?api_key={API_KEY}"
    response = requests.get(url)
    if response.status_code != 200:
        print(f"❌ Error fetching {endpoint}: {response.status_code}")
        return None
    return response.json()

# ===============================================
# 1️ Insert Competitions and Categories
# ===============================================
def insert_competitions():
    connection = create_connection()
    if not connection:
        print("❌ Database connection failed.")
        return

    cursor = connection.cursor()
    data = fetch_json("competitions.json")
    if not data:
        return

    competitions = data.get("competitions", [])
    df = pd.DataFrame(competitions).replace({np.nan: None})

    # ---- Insert Categories ----
    categories = df["category"].apply(pd.Series).drop_duplicates(subset=["id"])
    for _, row in categories.iterrows():
        cursor.execute("""
            INSERT IGNORE INTO Categories (category_id, category_name)
            VALUES (%s, %s)
        """, (row["id"], row["name"]))
    print(f"✅ Inserted {len(categories)} rows into Categories")

    # ---- Insert Competitions ----
    for _, row in df.iterrows():
        cat = row["category"]
        cursor.execute("""
            INSERT IGNORE INTO Competitions
            (competition_id, competition_name, parent_id, type, gender, category_id)
            VALUES (%s, %s, %s, %s, %s, %s)
        """, (
            row["id"],
            row["name"],
            row.get("parent_id"),
            row["type"],
            row["gender"],
            cat["id"] if cat else None
        ))

    connection.commit()
    cursor.close()
    connection.close()
    print("✅ Data inserted successfully into Competitions table!")

# ===============================================
# 2️ Insert Complexes and Venues
# ===============================================
def insert_complexes_and_venues():
    connection = create_connection()
    if not connection:
        print("❌ Database connection failed.")
        return

    cursor = connection.cursor()
    data = fetch_json("complexes.json")
    if not data:
        return

    complexes = data.get("complexes", [])

    for complex_ in complexes:
        cursor.execute("""
            INSERT IGNORE INTO Complexes (complex_id, complex_name)
            VALUES (%s, %s)
        """, (complex_["id"], complex_["name"]))

        for v in complex_.get("venues", []):
            cursor.execute("""
                INSERT IGNORE INTO Venues 
                (venue_id, venue_name, city_name, country_name, country_code, timezone, complex_id)
                VALUES (%s, %s, %s, %s, %s, %s, %s)
            """, (
                v.get("id"),
                v.get("name"),
                v.get("city_name"),
                v.get("country_name"),
                v.get("country_code"),
                v.get("timezone"),
                complex_["id"]
            ))

    connection.commit()
    cursor.close()
    connection.close()
    print("✅ Complexes and Venues inserted successfully!")

# ===============================================
# 3️ Insert Competitors and Rankings (from CSVs)
# ===============================================
def insert_competitors_rankings():
    connection = create_connection()
    if not connection:
        print("❌ Database connection failed.")
        return

    cursor = connection.cursor()

    # ---- Load CSV files ----
    if not os.path.exists("rankings.csv") or not os.path.exists("competitors.csv"):
        print("⚠️ Missing competitors.csv or rankings.csv — please fetch first.")
        return

    df_rankings = pd.read_csv("rankings.csv").replace({np.nan: None})
    df_competitors = pd.read_csv("competitors.csv").replace({np.nan: None})

    # ---- Insert Competitors ----
    for _, row in df_competitors.iterrows():
        cursor.execute("""
            INSERT IGNORE INTO Competitors 
            (competitor_id, name, country, country_code, abbreviation)
            VALUES (%s, %s, %s, %s, %s)
        """, (
            row["competitor_id"],
            row["name"],
            row["country"],
            row["country_code"],
            row["abbreviation"]
        ))
    print(f"✅ Inserted {len(df_competitors)} rows into Competitors")

    # ---- Insert Rankings ----
    if "tournaments_played" in df_rankings.columns:
        df_rankings.rename(columns={"tournaments_played": "competitions_played"}, inplace=True)

    for _, row in df_rankings.iterrows():
        cursor.execute("""
            INSERT INTO Competitor_Rankings
            (rank, movement, points, competitions_played, competitor_id)
            VALUES (%s, %s, %s, %s, %s)
        """, (
            int(row["rank"]) if pd.notna(row["rank"]) else None,
            int(row["movement"]) if pd.notna(row["movement"]) else None,
            int(row["points"]) if pd.notna(row["points"]) else None,
            int(row["competitions_played"]) if "competitions_played" in df_rankings.columns and pd.notna(row["competitions_played"]) else None,
            row["competitor_id"]
        ))

    connection.commit()
    cursor.close()
    connection.close()
    print("✅ Data inserted successfully into Competitors and Competitor_Rankings tables!")

# ===============================================
# MAIN EXECUTION
# ===============================================
if __name__ == "__main__":
    print("🚀 Starting full data insertion process...")

    insert_competitions()
    insert_complexes_and_venues()
    insert_competitors_rankings()

    print("🏁 All data fetched and inserted successfully!")

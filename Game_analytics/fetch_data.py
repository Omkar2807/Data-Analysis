import os
import requests
import pandas as pd
from dotenv import load_dotenv

# ===============================================
# Load environment variables
# ===============================================
load_dotenv()

API_KEY = os.getenv("SPORTS_API_KEY")
BASE_URL = os.getenv("BASE_URL")  # e.g., https://api.sportradar.com/tennis/trial/v3/en

# ===============================================
# Helper function for API requests
# ===============================================
def fetch_json(endpoint):
    """Generic helper to fetch and return JSON data."""
    url = f"{BASE_URL}/{endpoint}?api_key={API_KEY}"
    response = requests.get(url)

    if response.status_code != 200:
        print(f"❌ Error fetching {endpoint}: {response.status_code}")
        return None

    return response.json()

# ===============================================
# 1️ Fetch Competitions
# ===============================================
def fetch_competitions():
    """Fetch competition and category data."""
    data = fetch_json("competitions.json")
    if not data:
        return None, None

    competitions = data.get("competitions", [])
    category_data, competition_data = [], []

    for comp in competitions:
        cat = comp.get("category", {})
        category_data.append({
            "category_id": cat.get("id"),
            "category_name": cat.get("name")
        })
        competition_data.append({
            "competition_id": comp.get("id"),
            "competition_name": comp.get("name"),
            "parent_id": comp.get("parent_id"),
            "type": comp.get("type"),
            "gender": comp.get("gender"),
            "category_id": cat.get("id")
        })

    df_categories = pd.DataFrame(category_data).drop_duplicates(subset=["category_id"])
    df_competitions = pd.DataFrame(competition_data)

    df_categories.to_csv("categories.csv", index=False)
    df_competitions.to_csv("competitions.csv", index=False)

    print("✅ Categories and Competitions data fetched and saved.")
    return df_categories, df_competitions

# ===============================================
# 2️ Fetch Complexes and Venues
# ===============================================
def fetch_complexes():
    """Fetch complexes and their venues."""
    data = fetch_json("complexes.json")
    if not data:
        return None, None

    complexes = data.get("complexes", [])
    complex_data, venue_data = [], []

    for complex_ in complexes:
        complex_data.append({
            "complex_id": complex_["id"],
            "complex_name": complex_["name"]
        })
        for v in complex_.get("venues", []):
            venue_data.append({
                "venue_id": v["id"],
                "venue_name": v["name"],
                "city_name": v["city_name"],
                "country_name": v["country_name"],
                "country_code": v["country_code"],
                "timezone": v["timezone"],
                "complex_id": complex_["id"]
            })

    df_complexes = pd.DataFrame(complex_data)
    df_venues = pd.DataFrame(venue_data)

    df_complexes.to_csv("complexes.csv", index=False)
    df_venues.to_csv("venues.csv", index=False)

    print("✅ Complexes and Venues data fetched and saved.")
    return df_complexes, df_venues

# ===============================================
# 3️ Fetch Doubles Competitor Rankings
# ===============================================
def fetch_double_competitor_rankings():
    """Fetch doubles competitors and rankings."""
    data = fetch_json("double_competitors_rankings.json")
    if not data:
        return None, None

    rankings = data.get("rankings", [])
    all_competitors, all_rankings = [], []

    for r in rankings:
        competitor_rankings = r.get("competitor_rankings", [])
        for cr in competitor_rankings:
            competitor = cr.get("competitor", {})
            all_competitors.append({
                "competitor_id": competitor.get("id"),
                "name": competitor.get("name"),
                "country": competitor.get("country"),
                "country_code": competitor.get("country_code"),
                "abbreviation": competitor.get("abbreviation"),
                "gender": competitor.get("gender")
            })
            all_rankings.append({
                "rank": cr.get("rank"),
                "movement": cr.get("movement"),
                "points": cr.get("points"),
                "competitions_played": cr.get("competitions_played"),
                "competitor_id": competitor.get("id")
            })

    df_competitors = pd.DataFrame(all_competitors).drop_duplicates(subset=["competitor_id"])
    df_rankings = pd.DataFrame(all_rankings)

    df_competitors.to_csv("competitors.csv", index=False)
    df_rankings.to_csv("rankings.csv", index=False)

    print("✅ Doubles competitor rankings fetched and saved.")
    return df_competitors, df_rankings

# ===============================================
# 4️ Fetch Competitor Profiles
# ===============================================
def fetch_competitor_profiles(competitor_ids):
    """Fetch detailed competitor profiles based on competitor IDs."""
    competitors = []
    for cid in competitor_ids:
        encoded_id = cid.replace(":", "%3A")
        endpoint = f"competitors/{encoded_id}/profile.json"
        data = fetch_json(endpoint)
        if not data:
            print(f"⚠️ Failed for {cid}")
            continue

        c = data.get("competitor", {})
        competitors.append({
            "competitor_id": c.get("id"),
            "name": c.get("name"),
            "country": c.get("country"),
            "abbreviation": c.get("abbreviation"),
            "gender": c.get("gender")
        })

    df = pd.DataFrame(competitors)
    df.to_csv("competitor_profiles.csv", index=False)
    print("✅ Competitor profiles fetched and saved.")
    return df

# ===============================================
# MAIN EXECUTION
# ===============================================
if __name__ == "__main__":
    print("🚀 Starting data fetch process...")

    # 1. Competitions
    fetch_competitions()

    # 2. Complexes and Venues
    fetch_complexes()

    # 3. Doubles Rankings
    df_competitors, df_rankings = fetch_double_competitor_rankings()

    # 4. Competitor Profiles (Top 10 from rankings)
    if df_rankings is not None:
        top_ids = df_rankings["competitor_id"].dropna().unique()[:10]
        fetch_competitor_profiles(top_ids)

    print("🏁 All data fetched and saved successfully.")

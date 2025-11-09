# This file builds an interactive Streamlit dashboard that connects to the MySQL database, queries tennis data, and displays insights such as top players, country analysis, and venues.
import streamlit as st
import pandas as pd
from db_connection import create_connection   # Custom DB connection helper
from dotenv import load_dotenv
import os

# Load environment variables (e.g., DB credentials from .env)
load_dotenv()

# Configure Streamlit page settings
st.set_page_config(page_title="Game Analytics — Tennis", layout="wide")


# Helper Functions
@st.cache_data(ttl=300)
def run_query(sql, params=None):
    """
    Executes a SQL SELECT query and returns a pandas DataFrame.

    Args:
        sql (str): SQL query string to execute.
        params (tuple or list): Optional query parameters.

    Returns:
        pd.DataFrame: Result of the SQL query.
    """
    conn = create_connection()
    if not conn:
        st.error("Cannot connect to database. Check db_connection.py and .env.")
        return pd.DataFrame()
    try:
        # Execute SQL and read results into a DataFrame
        df = pd.read_sql(sql, conn, params=params)
    except Exception as e:
        st.error(f"SQL error: {e}")
        df = pd.DataFrame()
    finally:
        conn.close()
    return df


def run_scalar(sql):
    """
    Helper to execute a SQL query that returns a single scalar value.
    Used for KPIs such as total competitors, countries, etc.
    """
    df = run_query(sql)
    if df.empty:
        return None
    return df.iloc[0, 0]



# Sidebar Layout and Controls
st.sidebar.title("Controls")

# Sidebar navigation options
menu = st.sidebar.selectbox(
    "Navigate",
    ["Dashboard", "Competitors", "Venues", "Leaderboards", "SQL Explorer"]
)

# Country filter dropdown (populated from database)
country_filter = st.sidebar.selectbox(
    "Filter by Country (optional)",
    ["All"] + list(run_query(
        "SELECT DISTINCT country FROM Competitors ORDER BY country"
    ).country.fillna("").tolist())
)



# Page 1 — Dashboard
if menu == "Dashboard":
    st.title("🎾 Game Analytics — Dashboard")

    # --- KPI Section ---
    col1, col2, col3 = st.columns(3)

    # Fetch scalar KPIs
    total_comp = run_scalar("SELECT COUNT(*) FROM Competitors")
    total_countries = run_scalar("SELECT COUNT(DISTINCT country) FROM Competitors")
    max_points = run_scalar("SELECT MAX(points) FROM Competitor_Rankings")

    # Display KPI metrics
    col1.metric("Total Competitors", total_comp if total_comp is not None else "—")
    col2.metric("Countries Represented", total_countries if total_countries is not None else "—")
    col3.metric("Highest Points", max_points if max_points is not None else "—")

    # --- Competitions by Category ---
    st.markdown("#### Competitions by Category")
    df_cat = run_query("""
        SELECT cat.category_name, COUNT(c.competition_id) AS total_competitions
        FROM Competitions c
        JOIN Categories cat ON c.category_id = cat.category_id
        GROUP BY cat.category_name
        ORDER BY total_competitions DESC
    """)
    st.dataframe(df_cat, use_container_width=True)
    st.bar_chart(df_cat.set_index('category_name')['total_competitions'])

    # --- Top 10 Competitors by Points ---
    st.markdown("#### Top 10 Competitors (by points)")
    top10 = run_query("""
        SELECT c.name, r.rank, r.points
        FROM Competitors c
        JOIN Competitor_Rankings r ON c.competitor_id=r.competitor_id
        ORDER BY r.points DESC
        LIMIT 10
    """)
    st.dataframe(top10)



# Page 2 — Competitors
elif menu == "Competitors":
    st.title("🔎 Competitors")

    # Input fields for filtering competitors
    q_name = st.text_input("Search competitor name (partial):")
    rmin, rmax = st.slider("Filter by rank range (top)", 1, 2000, (1, 200))
    points_min = st.number_input("Min points", min_value=0, value=0, step=10)

    # Base SQL query with filters
    base_sql = """
        SELECT c.competitor_id, c.name, c.country, c.abbreviation,
               r.rank, r.points, r.competitions_played
        FROM Competitors c
        LEFT JOIN Competitor_Rankings r ON c.competitor_id = r.competitor_id
        WHERE (r.rank BETWEEN %s AND %s OR r.rank IS NULL)
        AND (r.points >= %s OR r.points IS NULL)
    """
    params = [rmin, rmax, points_min]

    # Optional name filter
    if q_name:
        base_sql += " AND c.name LIKE %s"
        params.append(f"%{q_name}%")

    # Optional country filter
    if country_filter != "All":
        base_sql += " AND c.country = %s"
        params.append(country_filter)

    # Final sorting and limit
    base_sql += " ORDER BY r.rank ASC LIMIT 500"

    # Execute query and display table
    df = run_query(base_sql, params=params)
    st.dataframe(df, use_container_width=True)



# Page 3 — Venues
elif menu == "Venues":
    st.title("🏟 Venues")

    # Join venues with their respective complexes
    df = run_query("""
        SELECT v.venue_id, v.venue_name, v.city_name, v.country_name,
               v.timezone, c.complex_name
        FROM Venues v
        LEFT JOIN Complexes c ON v.complex_id = c.complex_id
        ORDER BY v.country_name, v.city_name
    """)
    st.dataframe(df, use_container_width=True)



# Page 4 — Leaderboards
elif menu == "Leaderboards":
    st.title("🏅 Leaderboards")

    # --- Top Players by Rank ---
    st.subheader("Top Ranked (by rank)")
    top_ranked = run_query("""
        SELECT c.name, r.rank, r.points
        FROM Competitors c
        JOIN Competitor_Rankings r ON c.competitor_id=r.competitor_id
        ORDER BY r.rank ASC
        LIMIT 50
    """)
    st.dataframe(top_ranked, use_container_width=True)

    # --- Top Players by Points ---
    st.subheader("Top by Points")
    top_points = run_query("""
        SELECT c.name, r.rank, r.points
        FROM Competitors c
        JOIN Competitor_Rankings r ON c.competitor_id=r.competitor_id
        ORDER BY r.points DESC
        LIMIT 50
    """)
    st.dataframe(top_points, use_container_width=True)


# Page 5 — SQL Explorer (Read-Only Query Runner)
elif menu == "SQL Explorer":
    st.title("🧾 SQL Explorer (careful!)")
    st.write("Run a SELECT query (read-only).")

    # Text area for user query input
    user_sql = st.text_area(
        "Enter SQL (SELECT only):",
        height=150,
        value="SELECT * FROM Competitors LIMIT 20"
    )

    # Execute only if user clicks Run and query starts with SELECT
    run = st.button("Run Query")
    if run:
        if user_sql.strip().lower().startswith("select"):
            df = run_query(user_sql)
            st.dataframe(df, use_container_width=True)
        else:
            st.error("Only SELECT queries are allowed here.")

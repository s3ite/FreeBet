"""Main file qui va run le server."""

import requests
import mysql.connector


def create_database(key):
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        passwd="coucoumartin69"
        )
    mycursor = mydb.cursor()
    mycursor.execute("CREATE DATABASE "+key)
    mydb.commit()
    API_KEY = 'b3ef4600cf280cacb0716dedbe740e7b'
    REGIONS = 'eu'
    ODDS_FORMAT = 'decimal'
    DATE_FORMAT = 'iso'
    MARKETS = 'h2h,spreads'
    odds_response = requests.get(
    f'https://api.the-odds-api.com/v4/sports/'+key+'/odds',
    params={
        'api_key': API_KEY,
        'regions': REGIONS,
        'markets': MARKETS,
        'oddsFormat': ODDS_FORMAT,
        'dateFormat': DATE_FORMAT,
    }
    )
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        passwd="coucoumartin69",
        database = key
        )
    mycursor = mydb.cursor()
    mycursor.execute("CREATE TABLE INFO (home_team VARCHAR(255), away_team VARCHAR(255), sport_title VARCHAR(255), commence_time VARCHAR(255), home_cote FLOAT, AWAY_COTE FLOAT)")
    for match in odds_response.json():
        home_team = match["home_team"]
        away_team = match["away_team"]
        sport_title = match["sport_title"]
        commence_time = match["commence_time"]
        nb_bookmakers = 0
        home_cote = 0
        away_cote = 0
        for cote in match["bookmakers"]:
            nb_bookmakers += 1
            home_cote += cote["markets"][0]["outcomes"][0]["price"]
            away_cote += cote["markets"][0]["outcomes"][1]["price"]
        home_cote /= nb_bookmakers
        away_cote /= nb_bookmakers
        sqlFormula = "INSERT INTO INFO (home_team, away_team, sport_title, commence_time, home_cote, away_cote) VALUES (%s,%s,%s,%s,%s,%s)"
        students = [home_team, away_team, sport_title, commence_time, home_cote, away_cote]
        mycursor.execute(sqlFormula, students)
        mydb.commit()

        
    
def list_of_sports_sql():
    mydb = mysql.connector.connect(
    host = "localhost",
    user = "root", #↓Attention, pour éviter les attaques, il faut changer d'id et limiter le nb de connexion
    passwd = "coucoumartin69",
    database = "available_sports") #Il faudrat crée la database quand on mettra en marche le serveur
    cursor = mydb.cursor()
    cursor.execute("SELECT * FROM id")
    return cursor.fetchall()
    
def list_of_sports_api():
    API_KEY = 'b3ef4600cf280cacb0716dedbe740e7b'
    REGIONS = 'eu'
    ODDS_FORMAT = 'decimal'
    DATE_FORMAT = 'iso'
    MARKETS = 'h2h,spreads'
    sports_response = requests.get(
    'https://api.the-odds-api.com/v4/sports',
    params={
        'api_key': API_KEY
    })
    if sports_response.status_code != 200:
        print(f'Failed to get sports: status_code {sports_response.status_code}, response body {sports_response.text}')

    else:
        #print('List of in season sports:', sports_response.json())
        return sports_response.json()
        
def request_odds():
    """Va envoyer une requete api au serveur."""
    API_KEY = 'b3ef4600cf280cacb0716dedbe740e7b'
    REGIONS = 'eu'
    ODDS_FORMAT = 'decimal'
    DATE_FORMAT = 'iso'
    MARKETS = 'h2h,spreads'
    odds_response = requests.get(
    f'https://api.the-odds-api.com/v4/sports/soccer_france_ligue_one/odds',
    params={
        'api_key': API_KEY,
        'regions': REGIONS,
        'markets': MARKETS,
        'oddsFormat': ODDS_FORMAT,
        'dateFormat': DATE_FORMAT,
    }
    )
    if odds_response.status_code != 200:
        print(f'Failed to get odds: status_code {odds_response.status_code}, response body {odds_response.text}')

    else:
        odds_json = odds_response.json()
        print('Number of events:', len(odds_json))
        print(odds_json)

    # Check the usage quota
    print('Remaining requests', odds_response.headers['x-requests-remaining'])
    print('Used requests', odds_response.headers['x-requests-used'])

if __name__ == '__main__':
    """Main function."""
    #Get the list of sports :
    
    list_of_sports_api = list_of_sports_api()
    list_of_sports_sql = list_of_sports_sql()
    for key in list_of_sports_api:
        if key["key"] not in list_of_sports_sql and key["active"]: #Dans ce cas la, le sport n'est pas dans le serveur sql il faut donc créer une table.
            create_database(str(key["key"]))

    #request_odds()
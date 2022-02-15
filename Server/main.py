"""Main file qui va run le server."""

import requests
import mysql.connector
import time
from apscheduler.schedulers.blocking import BlockingScheduler
import datetime

def check_db(key, database):
    """Check if key is already in the list of database"""
    for i in range(len(database)):
        if key == database[i][0]:
            return True
    return False


def check_database_match(key):
    """Will check that the match is still in the api database"""
    print("check_match function :", datetime.datetime.now())
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
    if odds_response.status_code == 200:
        mydb = mysql.connector.connect(
            host="localhost",
            user="root",
            passwd="coucoumartin69",
            database = key
            )
        mycursor = mydb.cursor()
        sqlFormula = "SELECT * FROM INFO"
        mycursor.execute(sqlFormula)
        myresult = mycursor.fetchall()
        iscorrect = True
        for match in odds_response.json():
            for i in range(len(myresult)):
                if match['id'] == myresult[i][0]: #Si le match est dans la database
                    iscorrect = True
            if(not iscorrect):
                #delete the row of the database
                sql = "DELETE FROM INFO WHERE ID = '"+str(match['id'])+"'"
        return False
    else:
        print("Error :", odds_response.status_code, " at ", datetime.datetime.now())
        return False

def delete_database(key):
    """Function to delete a mysql database"""
    mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    passwd="coucoumartin69",
    database = "available_sports"
    )
    mycursor = mydb.cursor()
    sql = "DROP TABLE "+ key
    mycursor.execute(sql)
    mydb.commit()
    sql = "DELETE FROM id WHERE NAME = '"+key+"'" 
    mycursor.execute(sql)
    mydb.commit()
    print("delete database :", key, " at", datetime.datetime.now())


def check_match_cote(key):
    """Check if the cote of the match has changed, if not update the value in the database"""
    print("check_match_cote function :", datetime.datetime.now())
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
    if odds_response.status_code == 200:
        mydb = mysql.connector.connect(
            host="localhost",
            user="root",
            passwd="coucoumartin69",
            database = key
            )
        mycursor = mydb.cursor()
        sqlFormula = "SELECT * FROM INFO"
        mycursor.execute(sqlFormula)
        myresult = mycursor.fetchall()
        for match in odds_response.json():
            for i in range(len(myresult)):
                if match['id'] == myresult[i][0]: #Si le match est dans la database
                    if(match['odds']['h2h'][0]['decimal'] != myresult[i][1]):
                        sql = "UPDATE INFO SET COTE = '"+str(match['odds']['h2h'][0]['decimal'])+"' WHERE ID = '"+str(match['id'])+"'"
                        mycursor.execute(sql)
                        mydb.commit()
                        print("update cote :", match['id'], " at", datetime.datetime.now())

    

def create_database(key):
    print("create_database function :", datetime.datetime.now())
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
    if odds_response.status_code == 200:
        mydb = mysql.connector.connect(
            host="localhost",
            user="root",
            passwd="coucoumartin69"
            )
        mycursor = mydb.cursor()
        mycursor.execute("CREATE DATABASE "+key)
        mydb.commit()
        mydb = mysql.connector.connect(
            host="localhost",
            user="root",
            passwd="coucoumartin69",
            database = key
            )
        mycursor = mydb.cursor()
        mycursor.execute("CREATE TABLE INFO (home_team VARCHAR(255), away_team VARCHAR(255), sport_title VARCHAR(255), commence_time VARCHAR(255), home_cote FLOAT, AWAY_COTE FLOAT, id VARCHAR(255))")
        for match in odds_response.json(): #On va crée une ligne pour chaque match
            home_team = match["home_team"]
            away_team = match["away_team"]
            sport_title = match["sport_title"]
            commence_time = match["commence_time"]
            nb_bookmakers = 0
            home_cote = 0
            away_cote = 0
            id = match["id"]
            for cote in match["bookmakers"]:
                nb_bookmakers += 1
                home_cote += cote["markets"][0]["outcomes"][0]["price"]
                away_cote += cote["markets"][0]["outcomes"][1]["price"]
            if(nb_bookmakers > 0):
                home_cote /= nb_bookmakers
                away_cote /= nb_bookmakers
                sqlFormula = "INSERT INTO INFO (home_team, away_team, sport_title, commence_time, home_cote, away_cote, id) VALUES (%s,%s,%s,%s,%s,%s)"
                students = [home_team, away_team, sport_title, commence_time, home_cote, away_cote, id]
                mycursor.execute(sqlFormula, students)
                mydb.commit()
        mydb = mysql.connector.connect(
        host = "localhost",
        user = "root", #↓Attention, pour éviter les attaques, il faut changer d'id et limiter le nb de connexion
        passwd = "coucoumartin69",
        database = "available_sports") #Il faudrat crée la database quand on mettra en marche le serveur
        cursor = mydb.cursor()
        sqlFormula = "INSERT INTO id (NAME) VALUES (%s)"
        students = [str(key)]
        cursor.execute(sqlFormula, students)
        mydb.commit()
        
    
def get_list_of_sports_sql():
    print("list_of_sports_sql function :", datetime.datetime.now())
    mydb = mysql.connector.connect(
    host = "localhost",
    user = "root", #↓Attention, pour éviter les attaques, il faut changer d'id et limiter le nb de connexion
    passwd = "coucoumartin69",
    database = "available_sports") #Il faudrat crée la database quand on mettra en marche le serveur
    cursor = mydb.cursor()
    cursor.execute("SELECT * FROM id")
    return cursor.fetchall()

    
def get_list_of_sports_api():
    #print the log
    print("list_of_sports_api function :", datetime.datetime.now())
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
    print("request_odds function :", datetime.datetime.now())
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


def start():
    """Fonction qui va lancer le programme"""
    #Get the list of sports :
    print("start function :", datetime.datetime.now())
    list_of_sports_api = get_list_of_sports_api() #On récupère la liste des sports de l'api
    list_of_sports_sql = get_list_of_sports_sql() #On récupère la liste des sports de la base de données mysql
    for key in list_of_sports_api:
        if (not check_db(key["key"],list_of_sports_sql)) and (key["active"]): #Dans ce cas la, le sport n'est pas dans le serveur sql il faut donc créer une table.
            create_database(str(key["key"])) #On crée la table
            print("Database created at :", datetime.datetime.now())
        elif(not check_db(key["key"],list_of_sports_sql)):
            print("Sport not active :", key["key"], " at :", datetime.datetime.now())
            delete_database(str(key["key"])) #On supprime la table
        else:
            print("Sport already in database :", key["key"], " at :", datetime.datetime.now())
            check_database_match(key["key"]) #On vérifie si les matchs sont dans la base de données
            check_match_cote(key["key"]) #On vérifie si les cotes sont à jour dans la base de données


    print("Every database is created at :", datetime.datetime.now())
    scheduler = BlockingScheduler() #On crée un scheduler qui va lancer la fonction start toutes les heures
    scheduler.add_job(start, 'interval', hours=1)
    scheduler.start()
    

start()
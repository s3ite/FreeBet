"""Command file pour executer les commandes mysql."""

import mysql.connector

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    passwd="coucoumartin69",
    database = "available_sports"
    )
mycursor = mydb.cursor()
sql = "DROP DATABASE "+ "americanfootball_nfl"
mycursor.execute(sql)

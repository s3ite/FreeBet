"""Command file pour executer les commandes mysql."""

import mysql.connector

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    passwd="popolo69",
    )
mycursor = mydb.cursor()
newdata = str("CREATE DATABASE football")
mycursor.execute(newdata)
mydb.commit()

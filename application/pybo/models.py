import pymysql

host='127.0.0.1:3306'
user='root'
password=''
database='NoWaiting'

connection=None
cursor=None

def connect_db():
    global connection, cursor
    if connection==None and cursor==None:
        connection = pymysql.connect(host, user, password, database)
        cursor = connection.cursor()
    
    return connection, cursor

def disconnect_db():
    global connection, cursor
    if connection!=None and cursor!=None:
        connection.close()
        connection=None
        cursor=None
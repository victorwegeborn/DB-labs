from flask import Flask
from mysql.connector import connection


app = Flask(__name__)
cnx = connection.MySQLConnection(user='tester', password='password')


@app.route("/")
def hello():
    return "Hello World!"

if __name__ == "__main__":
    app.run()

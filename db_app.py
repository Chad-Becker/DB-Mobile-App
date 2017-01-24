from flask import Flask, render_template, url_for, jsonify
from flask_mysqldb import MySQL

dbApp = Flask(__name__)

dbApp.config.from_pyfile("db_config.py")

db = MySQL(dbApp)

@dbApp.route("/")
def index():
	name = "default name"
	return render_template("index.html", name = name)

@dbApp.route("/dbGet", methods = ["GET"])
def dbGet():
	conn = db.connection
	cur = conn.cursor()
	cur.execute('''SELECT firstName, comments FROM visitorsLog WHERE (ID=1 OR ID=3);''',)
        conn.commit()
        result = cur.fetchall()
	cur.close()
	return render_template("index.html", result = result, name = result[0][0])

@dbApp.route("/getDB", methods = ["GET"])
def getDB():
        return "hi"
        
if __name__ == "__main__":
	dbApp.run()

from flask import Flask, jsonify, send_file
from flask_mysqldb import MySQL
from dotenv import load_dotenv
import os 

app = Flask(__name__)

load_dotenv()

# MySQL configurations
app.config['MYSQL_USER'] = os.environ.get('MYSQL_USER')
app.config['MYSQL_PASSWORD'] = os.environ.get('MYSQL_PASSWORD')
app.config['MYSQL_DB'] = os.environ.get('MYSQL_DB')
app.config['MYSQL_HOST'] = os.environ.get('MYSQL_HOST')

mysql = MySQL(app)

@app.route('/get_all', methods=['GET'])
def get_products():
    try:
        cursor = mysql.connection.cursor()
        cursor.callproc('getProducts')
        data = cursor.fetchall()

        # Convert the result to a list of dictionaries for JSON serialization
        result = [{'id': row[0], 'name': row[1], 'tips': row[2]} for row in data]

        return jsonify(result)
    except Exception as e:
        return str(e)
    finally:
        cursor.close()

@app.route('/get_product/<string:id>', methods=['GET'])
def get_product(id):
    cursor = mysql.connection.cursor()
    cursor.callproc('getProduct', [id])
    data = cursor.fetchall()

    if data:

        result = {'id': data[0][0],
                  'name': data[0][1],
                  'type': data[0][2],
                  'tips': data[0][3],
                  'img': data[0][4]
                 }
        cursor.close()
        return jsonify(result)
    else:
        result = {'id': 'NONE'}
        return jsonify(result)

@app.route('/image/<string:id>', methods=['GET'])
def image(id):
    filename = 'img/'+id
    return send_file(filename)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')


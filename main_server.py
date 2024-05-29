from flask import Flask, request, jsonify
import sqlite3
from datetime import datetime

app = Flask(__name__)
DATABASE = 'metrics.db'

def init_db():
    conn = sqlite3.connect(DATABASE)
    cursor = conn.cursor()
    cursor.execute('''CREATE TABLE IF NOT EXISTS metrics (
                        id INTEGER PRIMARY KEY,
                        timestamp TEXT,
                        cpu REAL,
                        memory REAL,
                        disk REAL,
                        network REAL)''')
    conn.commit()
    conn.close()

@app.route('/metrics', methods=['POST'])
def receive_metrics():
    data = request.get_json()
    timestamp = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    cpu = data.get('cpu')
    memory = data.get('memory')
    disk = data.get('disk')
    network = data.get('network')

    conn = sqlite3.connect(DATABASE)
    cursor = conn.cursor()
    cursor.execute('INSERT INTO metrics (timestamp, cpu, memory, disk, network) VALUES (?, ?, ?, ?, ?)',
                   (timestamp, cpu, memory, disk, network))
    conn.commit()
    conn.close()
    return jsonify({'status': 'success'}), 200

@app.route('/metrics', methods=['GET'])
def get_metrics():
    conn = sqlite3.connect(DATABASE)
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM metrics ORDER BY timestamp DESC LIMIT 100')
    rows = cursor.fetchall()
    conn.close()
    metrics = []
    for row in rows:
        metrics.append({
            'timestamp': row[1],
            'cpu': row[2],
            'memory': row[3],
            'disk': row[4],
            'network': row[5]
        })
    return jsonify(metrics)

if __name__ == "__main__":
    init_db()
    app.run(host='0.0.0.0', port=5000)

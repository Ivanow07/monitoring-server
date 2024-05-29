from flask import Flask, jsonify
import subprocess

app = Flask(__name__)

def get_cpu_usage():
    output = subprocess.check_output(['bash', '-c', '/monitor/cpu_usage.sh']).decode('utf-8')
    data = output.splitlines()
    return {
        'cpu_model': data[0],
        'cpu_cores': data[1],
        'cpu_usage': data[2]
    }

def get_ram_usage():
    output = subprocess.check_output(['bash', '-c', '/monitor/ram_usage.sh']).decode('utf-8')
    data = output.split(',')
    return {
        'ram_used': data[0],
        'ram_available': data[1],
        'ram_total': data[2]
    }

def get_disk_usage():
    output = subprocess.check_output(['bash', '-c', '/monitor/disk_usage.sh']).decode('utf-8')
    data = output.split(',')
    return {
        'disk_used': data[0],
        'disk_available': data[1],
        'disk_total': data[2]
    }

def get_network_usage():
    output = subprocess.check_output(['bash', '-c', '/monitor/network_usage.sh']).decode('utf-8')
    data = output.split(',')
    return {
        'network_in': data[0],
        'network_out': data[1]
    }

@app.route('/status', methods=['GET'])
def status():
    cpu = get_cpu_usage()
    ram = get_ram_usage()
    disk = get_disk_usage()
    network = get_network_usage()
    return jsonify({
        **cpu,
        **ram,
        **disk,
        **network
    })

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5001)  # Change port for each server

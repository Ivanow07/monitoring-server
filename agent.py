import psutil
import requests
import time

MAIN_SERVER_URL = 'http://130.61.241.28:5000/metrics'

def collect_metrics():
    metrics = {
        'cpu': psutil.cpu_percent(interval=1),
        'memory': psutil.virtual_memory().percent,
        'disk': psutil.disk_usage('/').percent,
        'network': psutil.net_io_counters().bytes_sent + psutil.net_io_counters().bytes_recv
    }
    return metrics

def send_metrics(metrics):
    try:
        response = requests.post(MAIN_SERVER_URL, json=metrics)
        if response.status_code == 200:
            print('Metrics sent successfully')
        else:
            print('Failed to send metrics')
    except Exception as e:
        print(f'Error sending metrics: {e}')

if __name__ == "__main__":
    while True:
        metrics = collect_metrics()
        send_metrics(metrics)
        time.sleep(10)

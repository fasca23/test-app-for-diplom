import os
from flask import Flask

def get_version():
    with open('.version') as f:
        for line in f:
            if line.startswith('APP_VERSION='):
                return line.split('=')[1].strip()
    return 'unknown'

app = Flask(__name__)
VERSION = get_version()


@app.route('/')
def hello():
    return "Привет из Flask в Кубере! Каменев В.В. Версия: {VERSION}"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
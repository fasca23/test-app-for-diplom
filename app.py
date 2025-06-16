from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return "Привет из Flask в Кубере! Каменев В.В. Версия: v3.19.0"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
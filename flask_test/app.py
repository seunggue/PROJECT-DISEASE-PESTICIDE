from flask import Flask, render_template, url_for, request, Response
import requests, lxml.html
from lxml import etree
import urllib.parse as parser

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/map')
def test():
    return render_template('map.html')

@app.route('/map2')
def test2():
    queryString = request.query_string
    openapi_url = "http://ncpms.rda.go.kr/npmsAPI/service?"+queryString.decode('utf-8')
    post = requests.get(openapi_url).text
    asdf = parser.unquote_plus(post).replace('&nbsp;', ' ')
    with open('data.txt','w',encoding='utf') as my_data_files:
        my_data_files.write(asdf)

    return Response(post, mimetype='text/xml')


@app.route('/time')
def time():
    return render_template('time.html')

@app.route('/time2')
def time2():
    queryString = request.query_string
    openapi_url = "http://ncpms.rda.go.kr/npmsAPI/service?"+queryString.decode('utf-8')
    post = requests.get(openapi_url).text
    return Response(post, mimetype='text/xml')

if __name__ == "__main__":
    # app.run(debug=False)
    app.run(debug=False, host="::", port=80)
import sys
import requests
import cyrptoRSA

from http.server import HTTPServer, SimpleHTTPRequestHandler
import ssl
from urllib.parse import urlparse

def start(callback):

    def handler(*args):
        call(callback, *args)
    server = HTTPServer(('', int(8000)), handler)
    #keyfileとcertfileの設定、生成が必要です。
    #opensslコマンドでcert.pemの設定を実施しています。 openssl req -x509 -newkey rsa:2048 -keyout private-key.pem -out cert.pem -days 365
    server.socket = ssl.wrap_socket (server.socket,keyfile="private-key.pem",certfile='cert.pem', server_side=True)
    server.serve_forever()

class call(SimpleHTTPRequestHandler):

    def __init__(self, callback, *args):

        self.callback = callback
        SimpleHTTPRequestHandler.__init__(self, *args)
   
    def do_POST(self):
    
        parsed_path = urlparse(self.path)
        query = parsed_path.query
        self.send_response(200)
        self.end_headers()
        self.wfile.write(cyrptoRSA.start_Key(query.encode()).encode())
        
   
        return
        

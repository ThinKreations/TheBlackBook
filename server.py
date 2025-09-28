from http.server import ThreadingHTTPServer, BaseHTTPRequestHandler
from services.books import *
from services.signup import *
from services.login import *
from services.logout import *
import json

class Handler(BaseHTTPRequestHandler):
    def do_OPTIONS(self):
        self.send_response(200)
        self.send_header("Access-Control-Allow-Origin", "*")
        self.send_header("Access-Control-Allow-Methods", "GET, POST, OPTIONS")
        self.send_header("Access-Control-Allow-Headers", "Content-Type")
        self.end_headers()
    
    def do_GET(self):
        if self.path == "/books":
            libros_json = get_all_books()
            self.send_response(200)
            self.send_header("Content-type", "application/json; charset=utf-8")
            self.send_header("Access-Control-Allow-Origin", "*")
            self.send_header("Access-Control-Allow-Methods", "*")
            self.send_header("Access-Control-Allow-Headers", "Content-Type")
            self.end_headers()
            self.wfile.write(libros_json.encode("utf-8"))
        else:
            self.send_error(404, "No encontrado")

    def do_POST(self):
        content_length = int(self.headers.get('Content-Length', 0))
        body = self.rfile.read(content_length)
        data = json.loads(body)

        if self.path == "/signup":
            response = signup(data)
        elif self.path == "/login":
            response = login(data)
        elif self.path == "/logout":
            response = logout()
        else:
            self.send_error(404, "No encontró la dirección")
            return

        response_json = json.dumps(response, ensure_ascii=False)
        self.send_response(200)
        self.send_header("Content-Type", "application/json; charset=utf-8")
        self.send_header("Access-Control-Allow-Origin", "*")
        self.send_header("Access-Control-Allow-Methods", "*")
        self.send_header("Access-Control-Allow-Headers", "Content-Type")
        self.end_headers()
        self.wfile.write(response_json.encode("utf-8"))


if __name__ == "__main__":
    host = "localhost"
    server = ThreadingHTTPServer((host, 8080), Handler)
    print(f"Servidor en http://{host}:{8080}")
    server.serve_forever()

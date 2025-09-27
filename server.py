from http.server import ThreadingHTTPServer, BaseHTTPRequestHandler
from services.books import *

class Handler(BaseHTTPRequestHandler):
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

if __name__ == "__main__":
    host = "localhost"
    
    server = ThreadingHTTPServer((host, 8080), Handler)
    print(f"Servidor en http://{host}:{8080}")
    server.serve_forever()
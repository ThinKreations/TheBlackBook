from http.server import ThreadingHTTPServer, BaseHTTPRequestHandler
from services.books import *
from services.signup import *
from services.login import *
from services.logout import *
from services.prestamos import *
from services.multas import *
from services.wishlist import *
from services.credentials import *
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
        
        elif self.path.startswith("/wishlist") and not self.path.startswith("/wishlist/toggle"):
            from urllib.parse import urlparse, parse_qs
            query = parse_qs(urlparse(self.path).query)
            correo = query.get("correo", [None])[0]
            if not correo:
                response = {"status": "error", "msg": "Falta correo", "wishlist": []}
            else:
                response = get_wishlist(correo)
            response_json = json.dumps(response, ensure_ascii=False)
            self.send_response(200)
            self.send_header("Content-Type", "application/json; charset=utf-8")
            self.send_header("Access-Control-Allow-Origin", "*")
            self.end_headers()
            self.wfile.write(response_json.encode("utf-8"))
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
            if response.get("status") == "ok":
                generar_actualizar_multas()
        elif self.path == "/logout":
            response = logout()
        elif self.path == "/prestamos":
            correo = data.get("correo")
            response = get_prestamos_usuario(correo)
        elif self.path == "/prestamos/add": 
            correo = data.get("correo")
            id_libro = data.get("id_libro")
            if not correo or not id_libro:
                response = {"status": "error", "msg": "Falta un correo"}
            else:
                response = post_prestamo(correo, id_libro)
        elif self.path == "/multas":
            correo = data.get("correo")
            if not correo:
                response = {"status": "error", "msg": "Falta correo"}
            else:
                response = consultar_multas(correo)
        elif self.path == "/wishlist/toggle":
            try:
                data = json.loads(body)
                input_data = PostWishlistInput(**data)
                response = toggle_wishlist(input_data)
            except Exception as e:
                response = {"status": "error", "msg": str(e)}
        elif self.path == "/forgotPass":
            response = forgotPass(data)
        from http.server import ThreadingHTTPServer, BaseHTTPRequestHandler
from services.books import *
from services.signup import *
from services.login import *
from services.logout import *
from services.prestamos import *
from services.multas import *
from services.wishlist import *
from services.credentials import *
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
        
        elif self.path.startswith("/wishlist") and not self.path.startswith("/wishlist/toggle"):
            from urllib.parse import urlparse, parse_qs
            query = parse_qs(urlparse(self.path).query)
            correo = query.get("correo", [None])[0]
            if not correo:
                response = {"status": "error", "msg": "Falta correo", "wishlist": []}
            else:
                response = get_wishlist(correo)
            response_json = json.dumps(response, ensure_ascii=False)
            self.send_response(200)
            self.send_header("Content-Type", "application/json; charset=utf-8")
            self.send_header("Access-Control-Allow-Origin", "*")
            self.end_headers()
            self.wfile.write(response_json.encode("utf-8"))
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
            if response.get("status") == "ok":
                generar_actualizar_multas()
        elif self.path == "/logout":
            response = logout()
        elif self.path == "/prestamos":
            correo = data.get("correo")
            response = get_prestamos_usuario(correo)
        elif self.path == "/prestamos/add": 
            correo = data.get("correo")
            id_libro = data.get("id_libro")
            if not correo or not id_libro:
                response = {"status": "error", "msg": "Falta un correo"}
            else:
                response = post_prestamo(correo, id_libro)
        elif self.path == "/multas":
            correo = data.get("correo")
            if not correo:
                response = {"status": "error", "msg": "Falta correo"}
            else:
                response = consultar_multas(correo)
        elif self.path == "/wishlist/toggle":
            try:
                input_data = PostWishlistInput(**data)
                response = toggle_wishlist(input_data)
            except Exception as e:
                response = {"status": "error", "msg": str(e)}
        elif self.path == "/forgotPass":
            response = forgotPass(data)
        elif self.path == "/changePass":
            response = changePass(data)
        else:
            self.send_error(404, "No encontré la dirección :( ")
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
from services.books import *


def handle_route(path):
    if path == "/books":
        return get_all_books()
    else:
        return None
    

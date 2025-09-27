from .database import getConnection
import json

def login():
    conn = getConnection()
    
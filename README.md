# The Black Book

Este proyecto es presentado por:

- Colín Santillán Alejandro
- Hernández Pascua Brandon
- Nápoles Munguía José de Jesús
- Sandoval Ramírez Marco Julian
- Segundo Vargas Josué Armando

## Instrucciones de uso:
Clona el repositorio, una vez instaladas las tecnologías mencionadas más abajo, deberás ejecutar los siguientes comandos en una terminal cada uno:
`python server.py` en la **raíz del proyecto**
`python -m http.server 3000` en la carpeta **public/**
Podrás acceder a la web en el http:/localhost:3000/ y el back se ejecutará en el /8080

## Arquitectura del proyecto
Este proyecto es un Monolito con REST interno, es decir, todo está en un sólo servidor pero el back ofrece una API para que el front reciba datos dinámicos y actualice la interfaz sin recargar la página.

## Tecnologías
- **Python (Vanilla)**: Backend 3.13.7
    PIP:
    - "http.server": para levantar el servidor y manejar rutas (ESTE YA VIENE INSTALADO)
    - pyodbc 5.2.0  (pip install en la raíz del proyecto)
    - python-dotenv 1.1.1
    - pydantic 2.11.9
        - Con pydantic se instalan:
        - annotated-types   0.7.0
        - pydantic          2.11.9
        - pydantic_core     2.33.2
        - typing_extensions 4.15.0
        - typing-inspection 0.4.1
    - Luego defino lo demás xd
- **HTML, CSS y JS**: Frontend
    - "Web-Components": Componentes modulares reutilziables con JS
    - "Fetch": Realizar peticiones hacia el back
- **SQL Server**: Database
    ODBC Driver 17 for SQL Server

    ## ES NECESARIO ARMAR MANUALMENTE UN ARCHIVO .env EN LA RAÍZ DEL PROYECTO CON LO SIGUIENTE:
    SERVER=localhost\SQLEXPRESS (O COMO ACCEDAN A SQL SERVER MANAGEMENT STUDIO)
    NAME=Libreria
    DRIVER={ODBC Driver 17 for SQL Server} O EL DRIVER QUE TENGAN
    MAILPASS=ESTA LA PASAMOS POR MENSAJE


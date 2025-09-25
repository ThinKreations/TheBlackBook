# The Black Book

Este proyecto es presentado por:

- Colín Santillán Alejandro
- Hernández Pascua Brandon
- Nápoles Munguía José de Jesús
- Segundo Vargas Josué Armando

## TODO
- Manual Técnico
- Manual de Identidad
- Backlog (Excel)
- Reporte de proyecto
- Reporte de evidencia
- Front y back xd

## Arquitectura del proyecto
Este proyecto es un Monolito con REST interno, es decir, todo está en un sólo servidor pero el back ofrece una API para que el front reciba datos dinámicos y actualice la interfaz sin recargar la página.

## Tecnologías
- **Python (Vanilla)**: Backend 3.13.7
    - "http.server": para levantar el servidor y manejar rutas (ESTE YA VIENE INSTALADO)
    - pyodbc 5.2.0  (pip install en la raíz del proyecto)
    - python-dotenv 1.1.1
    - Luego defino lo demás xd
- **HTML, CSS y JS**: Frontend
    - "Web-Components": Componentes modulares reutilziables con JS
    - "Fetch": Realizar peticiones hacia el back
- **SQL Server**: Database

## Los puse todos aquí xd
class Autor:
    def __init__(self, autor, nombre_autor, apellido_autor, fecha_nacimiento):
        self.autor = autor
        self.nombre_autor = nombre_autor
        self.apellido_autor = apellido_autor
        self.fecha_nacimiento = fecha_nacimiento

    def to_dict(self):
        return self.__dict__

class Editorial:
    def __init__(self, numero_editorial, nombre_editorial):
        self.numero_editorial = numero_editorial
        self.nombre_editorial = nombre_editorial

    def to_dict(self):
        return self.__dict__

class Libro:
    def __init__(self, id_libro, titulo, numero_editorial, nom_categoria,
                 anio_publicacion, numero_ejemplares):
        self.id_libro = id_libro
        self.titulo = titulo
        self.numero_editorial = numero_editorial
        self.nom_categoria = nom_categoria
        self.anio_publicacion = anio_publicacion
        self.numero_ejemplares = numero_ejemplares
    def to_dict(self):
        return self.__dict__

class LibroXAutor:
    def __init__(self, id_libro, autor):
        self.id_libro = id_libro
        self.autor = autor

    def to_dict(self):
        return self.__dict__

class Usuario:
    def __init__(self, usuario, nombre, apellido_p, apellido_m, email,
                 direccion_email, celular, calle, num_ext, colonia,
                 alcaldia, cp, sexo):
        self.usuario = usuario
        self.nombre = nombre
        self.apellido_p = apellido_p
        self.apellido_m = apellido_m
        self.email = email
        self.direccion_email = direccion_email
        self.celular = celular
        self.calle = calle
        self.num_ext = num_ext
        self.colonia = colonia
        self.alcaldia = alcaldia
        self.cp = cp
        self.sexo = sexo

    def to_dict(self):
        return self.__dict__

class Prestamo:
    def __init__(self, prestamo, usuario, fecha_prestamo, cantidad_libros):
        self.prestamo = prestamo
        self.usuario = usuario
        self.fecha_prestamo = fecha_prestamo
        self.cantidad_libros = cantidad_libros

    def to_dict(self):
        return self.__dict__

class DetPrest:
    def __init__(self, id_libro, prestamo, fecha_devolucion,
                 fecha_lim_devolucion, multa):
        self.id_libro = id_libro
        self.prestamo = prestamo
        self.fecha_devolucion = fecha_devolucion
        self.fecha_lim_devolucion = fecha_lim_devolucion
        self.multa = multa

    def to_dict(self):
        return self.__dict__

class Multa:
    def __init__(self, multa, valor_base_multa, descripcion_multa,
                 tipo_multa, monto_final_multa, fecha_emision_multa):
        self.multa = multa
        self.valor_base_multa = valor_base_multa
        self.descripcion_multa = descripcion_multa
        self.tipo_multa = tipo_multa
        self.monto_final_multa = monto_final_multa
        self.fecha_emision_multa = fecha_emision_multa

    def to_dict(self):
        return self.__dict__
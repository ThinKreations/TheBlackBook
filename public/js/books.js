export async function getAllBooks(){
    try{
        const response = await fetch("http://localhost:8000/books");
        if (!response.ok) 
            throw new Error("Error en la respuesta del servidor");
        const data = await response.json();
        return data;
    }catch (err){
        console.error("Error al obtener libros:", err);
        return [];
    }
}
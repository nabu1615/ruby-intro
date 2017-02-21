##### Crear un archivo #######

# Para crear un archivo le pasamos el nombre del archivo y el modo con el que lo queremos crear.

my_file = File.new("simple_file.txt", "w+")

# http://ruby-doc.org/core-2.1.2/IO.html#method-c-new-label-IO+Open+Mode
my_file.close
# Siempre cerrar el archivo, archivos abiertos van a seguir ocupando memoria.


#### ABRIENDO ARCHIVOS #######

# Podemos abrir un archivo existente usando

File.open(filename, mode)

# El modo puede ser alguno de los siguientes

=begin
r: read-only (Desde el principio del archivo)
w: write-only (Si el archivo existe, Sobreescribe todo en el archivo)
w+: read and write (Si el archivo existe, Sobreescribe todo en el archivo)
a+: read-write (Si el archivo existe, empiece desde el final del archivo. si no hay archivo cree uno). util para actualizar archivos.
=end


#### LEER ARCHIVOS #######

File.read("file_name") #-> Devuelve todo el contenido del archivo
File.readlines("file_name") #-> Lee todo el archivo linea por linea y devuelve esas lineas dentro de un array.



#### ABIR ARCHIVOS PARA ESCRITURA #######

# open -> use -> close

# En ruby podemos usar `write` y `puts` para escribir a archivos. puts agrega un salto de linea al final.


# Esta forma garantiza que se cierre el archivo
File.open("simple_file.txt", "w") { |file| file.write("adding first line of text") }

# Alternativamente

text = File.open("simple_file.txt",  "w+")
text.puts("another example of writing to a file.")

text.close

# Para agregar mas texto a `simple_file.txt` podemos hacer esto:

File.open("simple_file.txt", "a+") do |file|
  file << "New line of text"
end

File.readlines("simple_file.txt").each do |line|
  puts line
end

File.readlines("simple_file.txt").each_with_index do |line, line_num|
  puts "#{line_num}: #{line}"
end


##### BORRANDO ARCHIVOS #######


File.new("dummy_file.txt", "w+")
File.delete("dummy_file.txt")


#### ClASES DE FILE #########

File.class
File.superclass
Dir
Pathname
CSV

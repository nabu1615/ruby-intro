require 'pathname'

file = Pathname.new(__FILE__)

pn = File.basename(file)

p "Hola mundo desde #{pn}"


if ARGV.index("--user") && ARGV.index("--greeting")
	name_index = ARGV.index("--user") + 1
	name_value = ARGV[name_index]
	greeting_index = ARGV.index("--greeting") + 1
	greeting_value = ARGV[greeting_index]	
	p "Hola #{name_value} #{greeting_value}"
else
	p 'Algo salio mal'
end

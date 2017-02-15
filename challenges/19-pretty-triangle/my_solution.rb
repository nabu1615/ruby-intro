# Pretty Triangle


# Tu solucion abajo:

def print_triangle(arg)
	array = (1..arg).to_a
	dot = []
	array.map do |num|
		dot.push("*" * num)
	end
	dot.each do |row|
		puts row
	end
end

print print_triangle(100)

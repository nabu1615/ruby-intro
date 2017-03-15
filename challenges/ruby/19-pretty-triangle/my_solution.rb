# Pretty Triangle

# Tu solucion abajo:

def print_triangle(arg)
    array = (1..arg).to_a
    dot = []
    array.map do |num|
        dot.push("*" *  num)
    end
    puts dot.join(',')
end

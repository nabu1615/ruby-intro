# Pseudocode



# 1. Solucion Inicial

def mode(array)
 freq = array.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
 array.max_by {|v| freq[v]}
end




# 2. Solucion con Refactor





###### DRIVER CODE #########

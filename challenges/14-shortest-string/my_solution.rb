# Shortest String

#Tu solucion abajo:

def shortest_string(array)
  return nil if array.empty?
  array.sort_by! {|x| x.length}
  array.first
end

def shortest_string(array)
  array.min({|a,b| a.length <=> b.length})
end

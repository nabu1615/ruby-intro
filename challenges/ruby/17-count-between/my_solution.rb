# Count Between

# Tu solucion abajo:

[1,2,3,4,5,6]
upper = 4
lower = 2


def count_between(arr, upper, lower)
  arr.count {|x| (x >= lower) && (x<= upper)}
end

def count_between(arr, lower, upper)
  count = 0
  arr.each do |x|
    if (x >= lower) && (x<= upper)
      count = count + 1
    end
  end
  count
end

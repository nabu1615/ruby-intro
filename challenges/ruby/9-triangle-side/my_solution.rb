# Triangle Side

# Tu solucion abajo:


def valid_triangle?(x,y,z)
  if x <= 0 && y <= 0 && z <= 0
    false
  elsif (x + y) <= z || (x + z) <= y || (y + z) <= x
    false
  else
    true
  end
end


def valid_triangle?(a, b, c)
  if (a+b>c) && (a+c>b) && (b+c>a)
    true
  else
    false
  end
end

















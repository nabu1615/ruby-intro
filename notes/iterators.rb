i=0
loop do
  i += 1
  print "#{i}"
  break if i==10
end


i=0
loop do
  i+=1
  next if i==3
  print "#{i} "
  break if i==10
end

i=0
while i < 11
  print "#{i} "
  i+=1
end


i=1
until i > 10
  print "#{i} "
  i+=1
end

for i in ['hola', 'como', 'estas']
  print "#{i} "
end

for value in [1,2,3,4,5,6,7,8,9,10]
  print "#{value} "
end

10.times do |i| print "#{i} " end

[1,2,3,4,5,6,7,8,9,10].each {|value| print "#{value} "}

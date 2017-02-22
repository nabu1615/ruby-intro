# Un SSN es el numero que identifica a los ciudadanos de USA. Es un numero de 9 digitos escrito normalmente en de esta forma ddd-dd-dddd.


# Determina si un string contiene un SSN o no.
def has_ssn?(string)
<<<<<<< HEAD
  # tu codigo va aca
  if string.match(/\d{3}-\d{2}-\d{4}/)
    true
  else
    false
  end
=======
  !!(string =~ (/\d{3}-\d{2}-\d{4}/))
>>>>>>> upstream/master
end

puts "has_ssn? returns true if it has what looks like a SSN"
puts has_ssn?("please don't share this: 234-60-1422") == true
p has_ssn?("please don't share this: 234-60-1422")

puts "has_ssn? returns false if it doesn't have a SSN"
puts has_ssn?("please confirm your identity: XXX-XX-1422") == false


# Busca el numero SSN que se encuntra dentro de un string, si hay uno dentro de ella. De lo contrario devuelve nil.
def grab_ssn(string)
<<<<<<< HEAD
  # tu codigo va aca
  return nil if !string.match(/\d{3}-\d{2}-\d{4}/)
=======
  string[/\d{3}-\d{2}-\d{4}/]
>>>>>>> upstream/master
end


puts "grab_ssn returns an SSN if the string has an SSN"
puts grab_ssn("please don't share this: 234-60-1422") == "234-60-1422"

puts "grab_ssn returns nil if it doesn't have a SSN"
puts grab_ssn("please confirm your identity: XXX-XX-1422") == nil


# Devuelve todos los SSN dentro de un string. Si no hay ninguno devuelve un arreglo Vacio.
def grab_all_ssns(string)
<<<<<<< HEAD
  # tu codigo va aca
  return [] if !string.scan(/\d{3}-\d{2}-\d{4}/)
=======
  string.scan(/\d{3}-\d{2}-\d{4}/)
>>>>>>> upstream/master
end


puts "grab_all_ssns returns all SSNs if the string has any SSNs"
p grab_all_ssns("234-60-1422, 350-80-0744, 013-60-8762")
puts grab_all_ssns("234-60-1422, 350-80-0744, 013-60-8762") == ["234-60-1422", "350-80-0744", "013-60-8762"]

puts "grab_all_ssns returns an empty Array if it doesn't have any SSNs"
puts grab_all_ssns("please confirm your identity: XXX-XX-1422") == []


# Ofusca todos los SSN dentro de un string, por ejmplo 123-55-4430 se convierte en  XXX-XX-4430. Deuvuele el string con los SSB ofuscados.
def hide_all_ssns(string)
<<<<<<< HEAD
  # tu codigo va aca
  match = string.scan(/\d{3}-\d{2}-\d{4}/)
  match.map do |elem|
    elem.gsub(/\d{3}-\d{2}/,"XXX-XX")
  end

=======
  string.gsub(/\d{3}-\d{2}-/, 'XXX-XX-' )
>>>>>>> upstream/master
end


puts "hide_all_ssns obfuscates any SSNs in the string"
p hide_all_ssns "234-60-1422, 350-80-0744, 013-60-8762"
puts hide_all_ssns("234-60-1422, 350-80-0744, 013-60-8762") == "XXX-XX-1422, XXX-XX-0744, XXX-XX-8762"

puts "hide_all_ssns does not alter a string without SSNs in it"
string = "please confirm your identity: XXX-XX-1422"
puts hide_all_ssns(string) == string


# Asegura que todos los SSN usen guiones (-) como separador de los numeros.
# Ejemplo: 480.01.4430 y 480014430 se convierten en 480-01-4430.
def format_ssns(string)
  string.gsub(/(\d{3})\D?(\d{2})\D?(\d{4})/, '\1-\2-\3')
end

puts "format_ssns finds and reformat any SSNs in the string"
puts format_ssns("234601422, 350.80.0744, 013-60-8762") == "234-60-1422, 350-80-0744, 013-60-8762"

puts "format_ssns does not alter a string without SSNs in it"
string = "please confirm your identity: 44211422"
puts format_ssns(string) == string
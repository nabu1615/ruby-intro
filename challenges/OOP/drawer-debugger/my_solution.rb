class Drawer

attr_reader :contents

# Se necesita algun metodo mas en esta clase?

def initialize
@contents = []
@open = true
end

def open
@open = true
end

def close
@open = false
end

def add_item
@contents << item
end

def remove_item(item = @contents.pop) #que hace pop?
@contents.delete(item)
end

def dump  # que debe devolver este metodo?
puts "Your drawer is empty."
end

def view_contents
puts "The drawer contains:"
@contents.each {|silverware| puts "- " + silverware.type }
end


class Silverware
attr_reader :type

# Se necesita algun otro metodo en esta clase?

def initialize(type, clean = true)
@type = type
@clean = clean
end

def eat
puts "eating with the #{type}"
@clean = false
end

end



# DRIVER CODE NO LO MODIFIQUES!!!
knife1 = Silverware.new("knife")

silverware_drawer = Drawer.new
silverware_drawer.add_item(knife1)
silverware_drawer.add_item(Silverware.new("spoon"))
silverware_drawer.add_item(Silverware.new("fork"))
silverware_drawer.view_contents

silverware_drawer.remove_item
silverware_drawer.view_contents
sharp_knife = Silverware.new("sharp_knife")


silverware_drawer.add_item(sharp_knife)

silverware_drawer.view_contents

removed_knife = silverware_drawer.remove_item(sharp_knife)
removed_knife.eat
removed_knife.clean_silverware
raise Exception.new("Your silverware is not actually clean!") unless removed_knife.clean_silverware == true

silverware_drawer.view_contents
silverware_drawer.dump
raise Exception.new("Your drawer is not actually empty") unless silverware_drawer.contents.empty?
silverware_drawer.view_contents

# Que necesitas aca para remover una cuchara? puedes modificar el driver code en este error.
raise Exception.new("You don't have a spoon to remove") unless silverware_drawer.contents.include?(spoon)

silverware_drawer.remove_item(spoon) #que pasa aca la primera vez que corre?
spoon.eat
puts spoon.clean #=> Esto deberia ser falso

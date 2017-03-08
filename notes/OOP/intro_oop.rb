# oop review:

# Las clases son como un planos, los nombres de clases son singulares, no plurales
# Las instancias (objetos) estan hechas en base a estos planos
# Los modulos crean `namespaces` que agrupan metodos
# Los metodos son funciones relacionadas con una clase y sus instancias

# OOP

# juan = {
#   name: 'Juan',
#   age: 26,
#   alive: true
# }



# def die(mortal)
#   mortal[:alive] = false
# end


# def person_status(person)
#   "#{person[:name]} tiene #{person[:age]}, y esta #{person[:alive] ? 'vivo' : 'muerto'}"
# end

# def birthday(obejtc)
#   person[:age] += 1
# end

# p person_status(juan)
# p birthday(perro)

# 60.times do |x|
#   birthday(juan)
# end

# die(juan)
# p person_status(juan)


#  OOP

# Una clase es la encapsulacion de Atributos y comportamientos
class Person

  # attr_reader :name, :age, :alive
  # attr_writer :name, :age, :alive
  attr_accessor :name, :age, :alive

  def initialize(name, age, alive)
    @name = name
    @age = age
    @alive = alive
  end

  def status
    "#{@name} tiene #{@age}, y esta #{@alive ? 'vivo' : 'muerto'}"
  end

  def birthday
    @age += 1
  end

  def die
    @alive = false
  end

  # Getters
  # def alive?
  #   @alive
  # end

  # Setters

  # def name=(new_name)
  #   @name = new_name
  # end



end

juan  = Person.new('', 26, true)
juan.alive
juan.name = 'Pepito'
pedro = Person.new('Pedro', 3432, false)


# p juan.status
# 100.times {|x| juan.birthday }
# juan.die
# p juan.status

# pedro.birthday






# def fizzbuz(n)
#   if  n % 3 == 0 && n % 5 == 0
#     puts 'fizzbuzz'
#   elsif n % 3 == 0
#     puts 'fizz'
#   elsif n % 5 == 0
#     puts 'buzz'
#   else
#     puts n
#   end
# end


# class Fizzbuzz

#   def initialize(number)
#     @number = number
#     result
#   end

#   def divisible_by_5?
#     @number % 5 == 0
#   end

#   def divisible_by_3?
#     @number % 3 == 0
#   end

#   def divisible_by_15?
#     @number % 15 == 0
#   end


#   def result
#     if @number.divisible_by_15?
#       puts 'fizzbuzz'
#     elsif @number.divisible_by_3?



#     end
#   end

# end

# fizzbuzz = Fizzbuzz.new(15)


# fizzbuz(15) -> 'fizzbuzz'
# fizzbuz(9) -> 'fizz'
# fizzbuz(10) -> 'buzz'
# fizzbuz(7) -> 7



class Coord


  def initialize(lat, long)
    @lat = lat
    @long = long
  end


end


class Dog

  @@na = 'n/a'

  def initialize(dog_values = {})
    @name = dog_values[:name] || 'anonymous'
    @color = dog_values[:color] || 'criollo'
    @breed = dog_values[:breed] || na
    @age  =  dog_values[:age] || 1
    @height = dog_values[:height] || na
    @skills = dog_values[:skills] || na
    @weight = dog_values[:weight] || na
    @sex = dog_values[:sex] || na
    @alive = dog_values[:alive] && false
    @alive = dog_values.fetch(:alive) { true }
  end



end




ozu = Dog.new({name: 'ozu', age: 6, breed: 'frenchie', color:  'black', height: 0.7, skills: ['sleep', 'eat'], weight: 14, alive: false})

enzo = Dog.new({name: 'ozu', age: 6, breed: 'frenchie', color:  'black', height: 0.7, skills: ['sleep', 'eat'], weight: 14, alive: true})


# def birthday(birthday_person)
#   birthday_person[:age] += 1
# end

# def die(mortal)
#   mortal[:alive] = false
# end

# def person_status(person)
#   "#{person[:name]}, is #{person[:age]} and is #{person[:alive] ? 'alive' : 'dead'}"
# end

# juan = {
#   name: 'Juan',
#   age: 26,
#   alive: true
# }

# 50.times {|i| birthday(juan)}

# die(juan)

# p person_status(juan)

# class Person
#   # attr_accessor :age, :name, :alive

#   def initialize(name, age, alive)
#     @name = name
#     @age = age
#     @alive = alive
#   end

#   def birthday
#      self.age = age + 1
#   end

#   def die
#     self.alive = false
#   end

#   def person_status
#     "#{name}, is #{age} and is #{alive ? 'alive' : 'dead'}"
#   end

#   private

#   def age
#     @age
#   end

#   def age=(new_age)
#     @age = new_age
#   end

# end


# juan = Person.new('juan', 26, true)
# juan.birthday
# p juan







# Gran Ejemplo de un sistema


module Hello  # modules agrupa metodos
  def ask
    "?"
  end

  def answer
    "!"
  end

  def smile
    ":)"
  end

  def weep_with_joy
    "boo hoo  :)"
  end
end

module MakeIt  # modules are used to create namespaces

  class Person
    def to_s
      "i'm a #{self.class}!"
    end
  end

  class Teacher < Person  # Herencia!
    include Hello  # Los modulos pueden sen incluidos

    attr_reader :name
    def initialize(args = {})
      @name = args[:name] || "Nameless Teacher"  # Agregar valores por defecto
    end

    def to_s
      super + "  my name is #{name}"
    end
  end

  class Guest < Person # Herencia
    def to_s  # Sobre escribiendo un metodo del padre (aka: super) class
      super + "  and i'm a guest here!"  # `super` hace referencia a la difinicion del metodo un nivel arriba del arbol
    end
  end

  class Student < Person  # Otra vez herencia
    attr_reader :name

    def initialize(name)
      @name = name || "New Student"
    end

    def to_s
      "hi, i'm a student and my name is #{name}"
    end
  end

  class Cohort
    MAX_SIZE = 30

    attr_reader :name, :students
    attr_accessor :in_session

    def initialize(args = {})
      @name = args[:name] || "New Cohort" # valor por defecto
      @students = args[:students] || []  # Composicion!
      @in_session = args.fetch(:in_session, false)  # Posible booleano como valor toca tener cuidado!
    end
  end

  module Bogota

    class Coach < Person

      Skill = Struct.new(:name, :level)

      attr_reader :name, :skills

      @active = []  # una variable de instancia para la clase

      class << self  # otra forma de expresar `def self.method_name`
        attr_reader :active

        def count
          @active.size
        end

        def request_help_on(topic)  # metooo de clase (ej. Coach.request_help_on('recursion'))
          coach = @active.detect {|coach| coach.skills.map(&:name).include? topic }
          return self.new unless coach
          coach
        end
      end

      def initialize(args = {})
        @name = args[:name] || "Nameless Coach"
        @skills = args[:skills] || [Skill.new(:kindness, :expert)]  # composicion de nuevo!  Aca van objetos de Skill

        self.class.active << self
      end


      def knows?(skill)
        @skills.map(&:name).include? skill.name  # usando Symbol#to_proc
      end

      def to_s
        "hi, i'm #{name} and " + super
      end
    end

  end

  module Medellin

    class Mentor

      def initialize(args = {})
        @name = args[:name] || "Nameless Mentor"
      end
    end

  end
end

module ConsoleHelper  # modules bundle methods
  extend self # Esto nos deja crear modulos en el singleton del modulo (ie. ConsoleHelper.render('hi'))

  def render(text)
    puts text
  end

  def prompt(text)
    render(text)
    gets.chomp
  end

  def render_collection(coll)
    coll.each {|item| render(item) }
  end

  def break
    render("-"*10)
    self
  end
end

# ---

# ConsoleHelper.render('hi there, watch this...')
# name = ConsoleHelper.prompt("what's your name, by the way?")
# ConsoleHelper.render("great. hello, #{name}!")

# ---

ConsoleHelper.break.render('let\'s meet some teachers:')

teachers =  %w[german juan sebastian simon]
              .map{|name| MakeIt::Teacher.new(name: name.capitalize)}

ConsoleHelper.render_collection(teachers)

# ---

ConsoleHelper.break.render("let's meet some students:")


students = %w[Diana Melissa Alex Miguel Roberto Javier Jorge
              Victor Nicolas Dumar Jeisson]
              .map{|name| MakeIt::Student.new(name)}

ConsoleHelper.render_collection(students)

# ---

ConsoleHelper.break.render("let's meet some coaches:")

coaches = %w[simon carolina diana]
             .map{|name| MakeIt::Bogota::Coach.new(name: name)}

ConsoleHelper.render_collection(coaches)

# ---

ConsoleHelper.break.render("let's skill-up the coaches ...")

tech = %i[ruby algos oop sql ux_ui html css javascript]
levels = %i[beginner intermediate advanced expert]

skill = MakeIt::Bogota::Coach::Skill

coaches.each do |coach|
  tech.sample(rand(1...tech.length)).each do |t|
    coach.skills << skill.new(t, levels.sample)
  end
end

ConsoleHelper.render("there are #{MakeIt::Bogota::Coach.count} coaches")

coaching_skills = coaches.map{|c| [c.name, c.skills.map(&:name).join(", ")].join(": ") }

ConsoleHelper.render_collection(coaching_skills)

# ---

ConsoleHelper.break.render("let's ask coaches for help:")

C = MakeIt::Bogota::Coach

sql_expert = C.request_help_on(:sql)
dance_expert = C.request_help_on(:samba)

ConsoleHelper.render(sql_expert)

# command = ARGV.first
# puts command + ' Esto es lo que tengo que hacer'


class Todo
  attr_accessor :todos
  def initialize(file)
    @file = File.new(file, 'a+')
    @todos = parse_file
  end

  def parse_file
    lines = @file.readlines
  end

  def add_todo(todo)
    @file.puts(todo)
  end

  def run
    case ARGV.first
    when 'list'
      puts self.todos
    when 'add'
      add_todo(ARGV[1])
      puts 'listo'
    else
      puts 'No entiendo eso'
    end
  end

end

todos = Todo.new('todos.txt')
todos.run

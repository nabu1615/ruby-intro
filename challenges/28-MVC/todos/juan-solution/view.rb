module View
  def self.print msg
    puts msg
  end

  def self.success msg
    puts "You successfully #{msg}"
  end

  def self.command_error cmd
    puts "#{cmd} is not a valid Todo command"
    puts "you can use any of the following commands:"
    puts %w(list add delete complete filter)
  end
end

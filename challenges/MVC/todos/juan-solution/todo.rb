# $:.unshift File.dirname(__FILE__)
require "csv"
require_relative "list"
require_relative "task"
require_relative "view"

class TodoController

  attr_reader :todo_list

  def initialize csv_path
    @csv_path = csv_path
    @todo_list = List.new
  end

  def init_todo
    parse_csv
  end

  def run cmd={}
    execute_command cmd
  end

  def list filter=nil
    todo_list.select_tasks(filter).each.with_index do |task, i|
      puts "#{i + 1}. ".ljust(4) + task.to_s
    end
  end

  def add task_name
    task = Task.new(name: task_name, created_at: Time.now.to_s[0..9])
    todo_list.add task
    save_list_to_csv
    View.success "added your task"
  end

  def delete task_id
    todo_list.delete task_id
    save_list_to_csv
    View.success "deleted task id #{task_id}"
  end

  def complete task_id
    task = todo_list.tasks[task_id -1]
    task.complete!
    save_list_to_csv
    View.success "completed task id #{task_id}"
  end

  private

  def parse_csv
    CSV.foreach(@csv_path) do |row|
      todo = Task.new(name: row.first, created_at: row[1], completed: row[2])
      todo_list.add todo
    end
  end

  def save_list_to_csv
    CSV.open(@csv_path, "wb") do |csv|
      @todo_list.tasks.each do |task|
        csv << [task.name, task.created_at, task.completed]
      end
    end
  end

  def execute_command cmd
    case cmd[:cmd]
    when "list"
      list cmd[:filter]
    when "add"
      add cmd[:args]
    when "complete"
      complete cmd[:args].to_i
    when "delete"
      delete cmd[:args].to_i
    when "filter"
    else
      return View.command_error cmd[:cmd]
    end

    list unless cmd[:cmd] == "list"
  end

end

def parse_command
  command = ARGV.first
  command, task_filter = command.split(":")
  args = ARGV[1..-1].join(' ')
  {cmd: command, filter: task_filter, args: args}
end

todo = TodoController.new("todo.csv")
todo.init_todo
todo.run parse_command

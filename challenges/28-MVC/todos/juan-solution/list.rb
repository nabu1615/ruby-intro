class List

  attr_reader :tasks

  def initialize
    @tasks = []
  end

  def add task
    self.tasks << task
  end

  def delete task_id
    index = task_id - 1
    self.tasks.delete_at(index)
  end

  def select_tasks filter
    case filter
    when "completed"
      self.tasks.select { |task| task.completed }.sort_by(&:completed)
    when "outstanding"
      self.tasks.select { |task| task.completed.nil? }.sort_by(&:created_at)
    else
      tasks
    end
  end
end

class Task

  attr_reader :name, :created_at, :completed

  def initialize(args)
    @name = args[:name]
    @created_at = args[:created_at]
    @completed = args[:completed]
  end

  def complete!
    @completed = Time.now.to_s[0..9]
  end

  def to_s
    status, date = completed ? ["✓", completed] : [" ⃞", created_at]
    "#{status}  #{date} - #{name}"
  end

end

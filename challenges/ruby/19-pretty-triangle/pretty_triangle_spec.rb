require_relative "my_solution"

describe 'print_triangle' do
  before(:each) do
    @output = StringIO.new
    @old_stdout = $stdout
    $stdout = @output
  end

  it "prints nothing if given 0" do
    print_triangle(0)
    @output.rewind
    expect(@output.read).to be_empty
  end

  it "prints '*' if given 1" do
    print_triangle(1)
    @output.rewind
    expect(@output.read).to eq "*\n"
  end

  it "prints a 5-row triangle" do
    print_triangle(5)
    @output.rewind
    expect(@output.read).to eq "*\n**\n***\n****\n*****\n"
  end

  it "has the correct last line for a 100-row triangle" do
    print_triangle(100)
    @output.rewind
    expect(@output.read.split("\n").last).to eq '*'*100
  end

  after(:each) do
    $stdout = @old_stdout
  end
end

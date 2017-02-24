# U2.W5: Build a simple guessing game


# I worked on this challenge [by myself, with: Amir Behashtaein ].

# 2. Pseudocode

# Input: An integer to set as answer and create and object that belongs to the Guessing #game class, and an integer for instance method guess
# Output: :corect when guess equals answers, high when guess i bigger than answer,
# and low when guess is smaller than answer. Also the solce instance method, needs to
# return true when guess equals answer and false otherwise.
# Steps:
# => create instance variable answer
# => create instance variable guess inside guess instance method
# => create a flow control that outputs :corect when guess equals answers, high when
#    guess i bigger than answer, and low when guess is smaller than answer.
# => create solve instance method that return true when guess equals answer
#    and false otherwise.



# 3. Initial Solution

class GuessingGame
  def initialize(answer)
    @answer = answer
  end
  def guess (guess)
    @guess = guess
    if @guess == @answer
      :correct
    elsif @guess > @answer
      :high
    else
      :low
    end
  end
  def solved?
    if @answer == @guess
      true
    else
      false
    end
  end
end





# 4. Refactored Solution

# class GuessingGame
#   def initialize(answer)
#     @answer = answer
#   end
#   def guess (guess)
#     @guess = guess
#     if @guess == @answer
#       :correct
#     elsif @guess > @answer
#       :high
#     else
#       :low
#     end
#   end
#   def solved?
#     if guess == :correct # I thought this would make the code more readable but im having trobles calling guess inside the solved method as guess dosent know wich parameter is bieng passed to it
#       true
#     else
#       false
#     end
#   end
# end






# 1. DRIVER TESTS GO BELOW THIS LINE

game = GuessingGame.new(10)
p game.guess(5) == :low
p game.guess(20)== :high
p game.solved?  == false
p game.guess(10)== :correct
p game.solved?  == true





# 5. Reflection
# As the previous challenge ths was an easy one, that requiere that we add flow control
# to the mix, that was easy just creating the flow control inside each instance method.
# The question know is how to use flow control when you use the attr method to refactor
# the code?
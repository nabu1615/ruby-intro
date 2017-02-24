require_relative 'ruby_racer'

players = ["a", "b"]

game = RubyRacer.new(players)
game.advance_player!("a")
game.players[0].position > 0
p game.finished? == false
p game.winner == nil

game.advance_player!("b")
game.players[0].position = 31
game.players[1].position = 19
p game.finished? == true
p game.winner == game.players[0].name

game.players[0].position = 30
game.players[1].position = 30
p game.winner == "It's a tie!"

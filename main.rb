# frozen-string-literal: true

require_relative 'game'
require_relative 'tic_tac_toe'

puts 'This is a tic tac toe game for two players!\n'
puts 'Player one, please enter your name:'
player_one = gets.chomp
puts 'Player two, please enter your name:'
player_two = gets.chomp

game = Game.new(player_one, player_two)
game.play

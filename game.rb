# frozen-string-literal: true

require_relative 'tic_tac_toe'

# Game Class
class Game
  def initialize(player_one, player_two, game = TicTacToe.new(player_one, player_two), turn = Random.new.rand(2))
    @game = game
    @player = turn
  end

  def play
    @game.draw_board
    move = ask_move(@player)
    return ask_move_again unless @game.legal_move?(move)

    @game.make_move(move, @player)
    return anounce_result(@player) if @game.over?(@player)

    change_turn
    play
  end

  def change_turn
    @player = @player.zero? ? 1 : 0
  end

  def ask_move(player)
    puts "#{@game.player_names[player]} please enter a number to play."
    puts "remember you are playing as #{@game.players[player]}."
    gets.chomp.to_i
  end

  def ask_move_again
    puts "Please enter a number withing 1-9 and that's not played already!"
    play
  end

  def anounce_result(player)
    @game.draw_board
    return anounce_winner(player) if @game.wins?(player)

    anounce_draw
  end

  def anounce_draw
    puts 'It was a draw!'
  end

  def anounce_winner(player)
    puts "Congrats #{@game.player_names[player]}, You Won!"
  end
end

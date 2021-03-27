# frozen_string_literal: true

# class for TicTacToe game
class TicTacToe
  attr_reader :players, :player_names

  private

  def initialize(player_one, player_two)
    @player_names = [player_one, player_two]
    @boxes = [*1..9]
    @players = %w[o x]
  end

  def full?
    true if @boxes.all? { |box| @players.include? box }
  end

  public

  def wins?(player)
    wins = [@boxes[0..2], @boxes[3..5], @boxes[6..8],
            @boxes.values_at(0, 3, 6), @boxes.values_at(1, 4, 7),
            @boxes.values_at(2, 5, 8), @boxes.values_at(0, 4, 8),
            @boxes.values_at(2, 4, 6)]
    true if wins.any? { |win| win.all? { |box| box == @players[player] } }
  end

  def legal_move?(move)
    true unless @players.include?(@boxes[move - 1]) || !move.between?(1, 9)
  end

  def draw_board
    puts "\t\t #{@boxes[6]} | #{@boxes[7]} | #{@boxes[8]}"
    puts "\t\t ---------"
    puts "\t\t #{@boxes[3]} | #{@boxes[4]} | #{@boxes[5]}"
    puts "\t\t ---------"
    puts "\t\t #{@boxes[0]} | #{@boxes[1]} | #{@boxes[2]}\n\n"
  end

  def over?(player)
    true if full? || wins?(player)
  end

  def make_move(move, player)
    @boxes[move - 1] = @players[player]
  end
end

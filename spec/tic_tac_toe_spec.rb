# frozen-string-literal: true

# rubocop:disable Metrics/BlockLength

require '../tic_tac_toe'

describe TicTacToe do
  subject(:tic_game) { described_class.new('Adel', 'Rafael') }
  let(:player) { 1 }

  describe '#wins?' do
    context 'when the board has 3 horizontal X marks' do
      before do
        tic_game.instance_variable_set(:@boxes, [*1..6] + %w[x x x])
      end

      it 'return true' do
        expect(tic_game.wins?(player)).to be true
      end
    end

    context 'when the board has 3 vertical X marks' do
      before do
        tic_game.instance_variable_set(:@boxes, [1, 2, 'x', 4, 5, 'x', 7, 8, 'x'])
      end

      it 'return true' do
        expect(tic_game.wins?(player)).to be true
      end
    end

    context 'when the board has 3 diagonal X marks' do
      before do
        tic_game.instance_variable_set(:@boxes, [1, 2, 'x', 4, 'x', 6, 'x', 8, 9])
      end

      it 'return true' do
        expect(tic_game.wins?(player)).to be true
      end
    end
  end

  describe '#make_move' do
    context 'when player (1) types a number between 1-9 (6)' do
      it 'fills that box (5) with player\'s signature (x)' do
        expect { tic_game.make_move(6, player) }.to change { tic_game.instance_variable_get(:@boxes)[5] }.from(6).to('x')
      end
    end
  end

  describe '#legal_move?' do
    context 'when given a number in the board 1-9 (9)' do
      it 'returns true' do
        expect(tic_game.legal_move?(9)).to be true
      end
    end

    context 'when given a number not in the board' do
      it 'is falsy' do
        expect(tic_game.legal_move?(0)).to be_falsy
      end
    end
  end
end

# rubocop:enable Metrics/BlockLength

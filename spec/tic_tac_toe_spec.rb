# frozen-string-literal: true

require '../tic_tac_toe'

describe TicTacToe do
  subject(:tic_game) { described_class.new('Adel', 'Rafael') }
  let(:player) { 1 }

  describe '#wins?' do
    context 'when the board has 3 horizontal X marks' do
      before do
        allow(tic_game).to receive(:make_move).with(7, player)
        allow(tic_game).to receive(:make_move).with(8, player)
        allow(tic_game).to receive(:make_move).with(9, player)
      end

      it 'return true' do
        expect(tic_game.wins?(player)).to be true
      end
    end
  end
end

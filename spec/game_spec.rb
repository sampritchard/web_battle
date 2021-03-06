require './lib/game'

describe Game do
  let(:player1) {double :player}
  let(:player2) {double :player}
  subject(:game) {described_class.new(player1, player2)}
  
  describe '#attack' do
    it 'damages the player' do
      expect(player2).to receive(:damage)
      Game.attack(player2)
    end
  end
  
  describe 'initialize' do
     it 'expects two player instances' do
	game = Game.new(player1, player2)
	expect(Game.player1).to eq player1
	expect(Game.player2).to eq player2
     end
  end

end

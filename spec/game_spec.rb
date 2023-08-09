require_relative '../src/game'

describe Game do
  let(:game20002023) { Game.new(2000, true, 2023) }
  let(:game20002020) { Game.new(2000, false, 2020) }
  let(:game20202023) { Game.new(2020, true, 2023) }
  let(:game20202020) { Game.new(2020, false, 2020) }

  describe '#initialize' do
    it 'creates a game with a last_played_at' do
      expect(game20002023).to be_instance_of(Game)
      expect(game20002023.last_played_at).to eql(2023)
      expect(game20002020.last_played_at).to eql(2020)
    end

    it 'creates a game with a last_played_at and multiplayer' do
      expect(game20002023.multiplayer).to eql(true)
      expect(game20002020.multiplayer).to eql(false)
    end

    it 'creates a game with a publish_date' do
      expect(game20002023.publish_date).to eql(2000)
      expect(game20202020.publish_date).to eql(2020)
    end
  end
end

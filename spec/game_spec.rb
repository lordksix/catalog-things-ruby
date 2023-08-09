require_relative '../src/game'
require_relative '../src/author'

describe Game do
  let(:game20002023) { Game.new(2000, true, 2023) }
  let(:game20002020) { Game.new(2000, false, 2020) }
  let(:game20202023) { Game.new(2020, true, 2023) }
  let(:game20202020) { Game.new(2020, false, 2020) }
  let(:author1) { Author.new('John', 'Doe') }
  let(:author2) { Author.new('Jane', 'Doe') }

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

  describe '#move_to_archive' do
    it 'sets archived property to true' do
      game20002020.move_to_archive
      expect(game20002020.archived).to eq(true)
    end

    it 'sets archived property to false' do
      game20002023.move_to_archive
      game20202023.move_to_archive
      game20202020.move_to_archive
      expect(game20002023.archived).to eq(false)
      expect(game20202023.archived).to eq(false)
      expect(game20202020.archived).to eq(false)
    end
  end

  describe '#to_hash' do
    it 'get hash from game instance' do
      author1.add_item(game20002020)
      expect(game20002020.to_hash).to eql({ archived: false, first_name: 'John', id: game20002020.id, last_name: 'Doe',
                                            last_played_at: 2020, multiplayer: false, publish_date: 2000 })
    end
  end
end

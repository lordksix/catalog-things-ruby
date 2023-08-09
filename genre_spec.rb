require_relative 'genre'
require_relative 'music_album'

RSpec.describe Genre do
  let(:genre) { Genre.new('Rock') }

  describe '#add_item' do
    it 'adds an item to the genre' do
      item = double('item')
      genre.add_item(item)
      expect(genre.items).to include(item)
    end

    it 'sets the genre property of the added item' do
      item = MusicAlbum.new('Album Title', 2023)
      genre.add_item(item)
      expect(item.genre).to eq(genre)
    end
  end
end

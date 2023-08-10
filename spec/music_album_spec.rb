require_relative '../src/music_album'
require_relative '../src/genre'

describe MusicAlbum do
  describe '#archived' do
    context 'when on_spotify is true' do
      it 'returns true for an album that can be archived' do
        music_album = described_class.new(true, '1999')
        expect(music_album.archived).to be(false)
      end

      it 'returns false for an album that cannot be archived' do
        new_publish_date = '2023'
        music_album = described_class.new(true, new_publish_date)
        expect(music_album.archived).to be(false)
      end
    end

    context 'when on_spotify is false' do
      it 'returns false regardless of release year' do
        music_album = described_class.new(false, '1999')
        expect(music_album.archived).to be(false)
      end
    end
  end
end

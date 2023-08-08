require_relative 'music_album'

RSpec.describe MusicAlbum do
  describe '#can_be_archived?' do
    context 'when on_spotify is true and parent can be archived' do
      it 'returns true' do
        album = MusicAlbum.new('Album Title', 'Artist Name', 2023)
        album.on_spotify = true
        allow(album).to receive(:super_can_be_archived?).and_return(true)

        expect(album.can_be_archived?).to eq(true)
      end
    end

    context 'when on_spotify is false' do
      it 'returns false' do
        album = MusicAlbum.new('Album Title', 'Artist Name', 2023)
        album.on_spotify = false
        allow(album).to receive(:super_can_be_archived?).and_return(true)

        expect(album.can_be_archived?).to eq(false)
      end
    end

    context 'when parent cannot be archived' do
      it 'returns false' do
        album = MusicAlbum.new('Album Title', 'Artist Name', 2023)
        album.on_spotify = true
        allow(album).to receive(:super_can_be_archived?).and_return(false)

        expect(album.can_be_archived?).to eq(false)
      end
    end
  end
end

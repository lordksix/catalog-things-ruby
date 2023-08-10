require_relative 'music_album'
require_relative 'genre'
require 'json'

class MusicsFilesHandler
  def initialize(music_albums)
    @music_albums = music_albums
  end

  def parse_music_albums
    return [] unless File.exist?('./music_albums.json')

    music_albums_file = File.open('./music_albums.json')
    data = JSON.parse(music_albums_file.read)
    music_albums_file.close
    data.map do |music_album|
      new_music_album = MusicAlbum.new(music_album['on_spotify'], music_album['publish_date'], music_album['id'])
      new_genre = Genre.new(music_album['genre']['name'], music_album['genre']['id'])
      new_genre.add_item(new_music_album)
      new_music_album
    end
  end

  def save_new_music_albums
    music_albums_data_array = []
    @music_albums.each do |music_album|
      music_albums_data_array << {
        publish_date: music_album.publish_date,
        on_spotify: music_album.on_spotify,
        id: music_album.id,
        genre: {
          name: music_album.genre.name,
          id: music_album.genre.id
        }

      }
    end
    File.write('./music_albums.json', JSON.pretty_generate(music_albums_data_array))
  end
end

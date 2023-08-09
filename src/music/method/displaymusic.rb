class DisplayMusic
  def initialize(music_albums)
    @music_albums = music_albums
  end

  def display_all_music_albums
    @music_albums.each_with_index do |music_album, index|
      genre_name = music_album.genre ? music_album.genre.name : 'N/A'
      info = "#{index}) on_Spotify: #{music_album.on_spotify}, " \
             "Publish Date: #{music_album.publish_date} Genre: #{genre_name}"
      puts info
    end
  end
end

display_music = DisplayMusic.new(music_albums)
display_music.display_all_music_albums

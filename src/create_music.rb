require_relative 'music_album'
require_relative 'genre'
require_relative 'input_data'

class CreateMusic < InputData
  def initialize(items)
    super()
    @music_albums = items
  end

  def create
    add_music
  end

  private

  def add_music
    puts "Input game's information"
    genre = genre_details
    music = music_details
    new_music = MusicAlbum.new(music[0], music[1])
    new_genre = Genre.new(genre[0])
    new_genre.add_item(new_music)
    @music_albums << new_music
    puts 'The music  was created successfully!'
  end

  def music_details
    music_album_date = get_year("'What's the publishing date? [year]'")
    print 'Is this Music Album on Spotify? [y/n]'
    print "\nAnswer: "
    spotify = gets.chomp
    is_on_spotify = case spotify.downcase
                    when 'y'
                      true
                    else
                      false
                    end
    [is_on_spotify, music_album_date]
  end
end

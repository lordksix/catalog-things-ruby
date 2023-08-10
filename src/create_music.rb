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
    print "\nWhat's the publish date? [year] "
    print "\nAnswer: "
    music_album_date = gets.chomp.to_i
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

  def get_year(msg)
    puts msg
    year = gets.chomp.to_i
    while year < 1000 || year > 2500
      puts msg
      year = gets.chomp.to_i
    end
    year
  end
end

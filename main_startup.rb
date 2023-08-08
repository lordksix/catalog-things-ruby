require 'json'
require_relative 'music_album'
require_relative 'genre'
require_relative 'item'

class App
  def initialize
    @books = []
    @music_albums = []
    @games = []
    @genres = [Genre.new('Blues'), Genre.new('Classical'), Genre.new('Hip hop'), Genre.new('Rap'),
               Genre.new('Pop'), Genre.new('Rock')]

    @choice_list = {
      '1' => 'List all books',
      '2' => 'List all music albums',
      '3' => 'List of games',
      '4' => 'List all genres',
      '5' => 'List all labels',
      '6' => 'List all authors',
      '7' => 'List all sources',
      '8' => 'Add a book',
      '9' => 'Add a music album',
      '10' => 'Add a game',
      '11' => 'Exit'
    }

    load_music_albums
  end

  def run
    puts 'Welcome to the Catalog of your Things'
    loop do
      display_options
      option = gets.chomp
      break if option == '11'

      handle_option(option)
    end
    exit_app
  end

  def handle_option(option)
    case option
    when '2'
      list_music_albums
    when '4'
      list_all_genres
    when '9'
      add_music_album
    when '11'
      exit_app
    else
      puts "Selected: #{@choice_list[option]}"
    end
  end

  def display_options
    puts 'Please choose your option by entering a number:'
    @choice_list.each { |key, value| puts "#{key} - #{value}" }
    print 'Your option ==> '
  end

  def list_all_genres
    puts 'Listing all genres:'
    @genres.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
      genre.items.each_with_index do |item, item_index|
        puts "   #{item_index + 1}. #{item.title} by #{item.artist} (#{item.release_year})" if item.is_a?(MusicAlbum)
      end
    end
  end

  def list_music_albums
    puts 'Listing all music albums:'
    @music_albums.each_with_index do |album, index|
      puts "#{index + 1}. #{album.title} by #{album.artist} (#{album.release_year})"
    end
  end

  def add_music_album
    new_album = create_new_album
    return unless new_album

    add_album_to_genre(new_album)
    @music_albums << new_album
    puts "Added #{new_album.title} by #{new_album.artist} to the list of music albums."
  end

  def create_new_album
    puts 'Enter the title of the music album:'
    title = gets.chomp
    puts 'Enter the artist:'
    artist = gets.chomp
    puts 'Enter the release year:'
    release_year = gets.chomp.to_i

    MusicAlbum.new(title, artist, release_year)
  end

  def add_album_to_genre(album)
    puts 'Enter the genre name:'
    genre_name = gets.chomp

    genre = find_genre_by_name(genre_name)
    if genre
      genre.add_item(album)
      album.add_genre(genre)
    else
      puts "Genre '#{genre_name}' not found."
    end
  end

  def find_genre_by_name(name)
    @genres.find { |genre| genre.name == name }
  end

  def load_music_albums
    return unless File.exist?('music_albums.json')

    begin
      json_data = JSON.parse(File.read('music_albums.json'))
      @music_albums = json_data.map do |data|
        album = MusicAlbum.from_json(data, @genres)
        genre_name = data['genre']
        genre = find_genre_by_name(genre_name)
        if genre
          genre.add_item(album)
          album.add_genre(genre)
        end
        album
      rescue JSON::ParserError => e
        puts "Error parsing music album data: #{e.message}"
        nil
      end.compact
    rescue JSON::ParserError => e
      puts "Error parsing music_albums.json: #{e.message}"
    end
  end

  def save_music_albums
    File.open('music_albums.json', 'w') do |file|
      json_data = @music_albums.map(&:to_json)
      file.puts(JSON.pretty_generate(json_data))
    end
  end

  def save_books
    File.open('books.txt', 'w') do |file|
      @books.each do |book|
        file.puts("#{book.title}, #{book.author}, #{book.published_year}")
      end
    end
  end

  def save_games
    File.open('games.txt', 'w') do |file|
      @games.each do |game|
        file.puts("#{game.title}, #{game.platform}, #{game.release_year}")
      end
    end
  end

  def exit_app
    save_music_albums
    save_books
    save_games
    puts 'Thank you for using this app'
  end
end

app = App.new
app.run

require 'json'
require_relative 'music_album'
require_relative 'genre'
require_relative 'item_music'

class App
  def initialize
    @books = []
    @music_albums = []
    @games = []
    @genres = []
    @genres = [Genre.new('Blues'), Genre.new('Classical Music'), Genre.new('Hip hop'), Genre.new('Rap'),
               Genre.new('Pop'), Genre.new('House')]

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
    if option == '11'
      exit_app
      return
    end

    case option
    when '2'
      list_music_albums
    when '4'
      list_all_genres
    when '9'
      add_music_album
    end
    puts "Selected: #{@choice_list[option]}"
  end

  def display_options
    puts 'Please choose your option by entering a number:'
    @choice_list.each { |key, value| puts "#{key} - #{value}" }
    print 'Your option ==> '
  end

  def item_name(option)
    {
      '1' => 'books',
      '2' => 'music albums',
      '3' => 'games'
    }[option]
  end

  def list_items(item)
    puts "Listing all #{item}"
  end

  def exit_app
    save_music_albums
    save_books
    save_games
    puts 'Thank you for using this app'
  end

  def add_music_album
    puts 'Enter the title of the music album:'
    title = gets.chomp
    puts 'Enter the artist:'
    artist = gets.chomp
    puts 'Enter the release year:'
    release_year = gets.chomp.to_i

    new_album = MusicAlbum.new(title, artist, release_year)
    @music_albums << new_album

    puts 'Enter the genre name:'
    genre_name = gets.chomp

    genre = find_genre_by_name(genre_name)
    if genre
      genre.add_item(new_album)
      puts "Added #{title} by #{artist} to the list of music albums."
    else
      puts "Genre '#{genre_name}' not found."
    end
  end

  def find_genre_by_name(name)
    @genres.find { |genre| genre.name == name }
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

  def load_music_albums
    return unless File.exist?('music_albums.json')

    json_data = JSON.parse(File.read('music_albums.json'))
    @music_albums = json_data.map { |data| MusicAlbum.from_json(data) }
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
end

app = App.new
app.run

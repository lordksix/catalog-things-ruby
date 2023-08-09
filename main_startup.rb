require_relative 'src/game'
require_relative 'src/author'
require_relative 'src/create_game'
require_relative 'src/create_book'
require_relative 'src/book'
require_relative 'src/label'
require_relative 'src/list_author'
require_relative 'src/game_file_handler'
require 'json'

class App
  def initialize
    @books = []
    @music_albums = []
    @games = []

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
  end

  def run
    puts 'Welcome to the Catalog of your Things'
    load_data_from_files
    loop do
      display_options
      option = gets.chomp
      break if option == '11'

      handle_option(option)
    end
    exit_app
  end

  def load_data_from_files
    load_game = GamesFilesHandler.new(@games)
    @games = load_game.parse_games
  end

  def handle_option(option)
    options = {
      '1' => method(:handle_option_one),
      '3' => method(:handle_option_three),
      '5' => method(:handle_option_five),
      '6' => method(:handle_option_six),
      '8' => method(:handle_option_eight),
      '10' => method(:handle_option_ten),
      '11' => method(:handle_option_eleven)
    }

    action = options[option]
    if action
      action.call
      list_items(item_name(option))
      puts "Selected: List all #{item_name(option)}"
    else
      puts 'Invalid option'
    end
  end

  # Define the individual option handlers as separate methods

  def handle_option_one
    list_books
  end

  def handle_option_three
    list_games
  end

  def handle_option_five
    list_labels(@books, @music_albums, @games)
  end

  def handle_option_six
    new_list = ListAuthorHandler.new(@books, @music_albums, @games)
    new_list.handle
  end

  def handle_option_eight
    new_book = CreateBook.new(@books)
    new_book.create
  end

  def handle_option_ten
    new_game = CreateGame.new(@games)
    new_game.handle
  end

  def handle_option_eleven
    exit_app
    nil
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
    savegame = GamesFilesHandler.new(@games)
    savegame.save_games
    # save_book1
    puts 'Thank you for using this app'
  end

  def save_music_albums
    File.open('music_albums.txt', 'w') do |file|
      @music_albums.each do |album|
        file.puts("#{album.title}, #{album.artist}, #{album.release_year}")
      end
    end
  end

  def save_books
    File.open('books.txt', 'w') do |file|
      @books.each do |book|
        file.puts("#{book.title}, #{book.author}, #{book.published_year}")
      end
    end
  end

  private

  def list_games
    puts 'List of all games'
    @games.each_with_index do |game, index|
      puts "\n[#{index + 1}] (ID:#{game.id})
        This game by #{game.author.last_name.upcase} has been published in '#{game.publish_date}'"
    end
  end
end

def list_books
  @books.each_with_index do |book, index|
    puts "\n[#{index + 1}] (ID:#{book.id}) The book: #{book.label.title} has been published in #{book.publish_date}"
  end
end

def list_labels(_books, _music_albums, _games)
  labels = []
  @books.each do |book|
    labels << book.label
  end
  @music_albums.each do |_music_albums|
    labels << book.label
  end

  @games.each do |game|
    labels << game.label
  end
  labels.each_with_index do |label, index|
    puts "[#{index + 1}] (ID: #{label.id}) Label: #{label.title}"
  end
end

app = App.new
app.run

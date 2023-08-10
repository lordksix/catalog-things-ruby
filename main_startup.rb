require_relative 'src/game'
require_relative 'src/author'
require_relative 'src/create_game'
require_relative 'src/create_book'
require_relative 'src/create_music'
require_relative 'src/book'
require_relative 'src/label'
require_relative 'src/list_author'
require_relative 'src/list_label'
require_relative 'src/game_file_handler'
require_relative 'src/book_file_handler'
require_relative 'src/music_file_handler'
require_relative 'src/list_genre'
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
      '7' => 'Add a book',
      '8' => 'Add a music album',
      '9' => 'Add a game',
      '10' => 'Exit'
    }
  end

  def run
    puts 'Welcome to the Catalog of your Things'
    load_data_from_files

    load_books_from_files

    load_musics_from_files

    loop do
      display_options
      option = gets.chomp
      break if option == '10'

      handle_option(option)
    end
    exit_app
  end

  def load_data_from_files
    load_game = GamesFilesHandler.new(@games)
    @games = load_game.parse_games
  end

  def load_books_from_files
    load_books = BooksFilesHandler.new(@Books)
    @books = load_books.parse_books
  end

  def load_musics_from_files
    load_musics = MusicsFilesHandler.new(@musics_albums)
    @music_albums = load_musics.parse_music_albums
  end

  def handle_option(option)
    options = {
      '1' => method(:handle_option_one),
      '2' => method(:handle_option_two),
      '3' => method(:handle_option_three),
      '4' => method(:handle_option_four),
      '5' => method(:handle_option_five),
      '6' => method(:handle_option_six),
      '7' => method(:handle_option_seven),
      '8' => method(:handle_option_eight),
      '9' => method(:handle_option_nine),
      '10' => method(:handle_option_ten)
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

  def handle_option_two
    list_musics
  end

  def handle_option_three
    list_games
  end

  def handle_option_four
    new_list = ListGenreHandler.new(@books, @music_albums, @games)
    new_list.handle
  end

  def handle_option_five
    new_list = ListLabelHandler.new(@books, @music_albums, @games)
    new_list.handle
  end

  def handle_option_six
    new_list = ListAuthorHandler.new(@books, @music_albums, @games)
    new_list.handle
  end

  def handle_option_seven
    new_book = CreateBook.new(@books)
    new_book.create
  end

  def handle_option_eight
    new_music = CreateMusic.new(@music_albums)
    new_music.create
  end

  def handle_option_nine
    new_game = CreateGame.new(@games)
    new_game.handle
  end

  def handle_option_ten
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
    savemusics = MusicsFilesHandler.new(@music_albums)
    savemusics.save_new_music_albums
    savegame = GamesFilesHandler.new(@games)
    savegame.save_games
    # save_book1
    savebook = BooksFilesHandler.new(@books)
    savebook.save_books
    puts 'Thank you for using this app'
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

def list_musics
  @music_albums.each_with_index do |music, index|
    puts "\n[#{index + 1}] (ID:#{music.id}) The Music: #{music.genre.name} has been published in #{music.publish_date}"
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

require_relative 'src/game'
require_relative 'src/author'
require_relative 'src/create_game'

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
    when '3'
      list_games
    when '6'
      list_authors @books, @music_albums, @games
    when '10'
      new_game = CreateGame.new(@games)
      new_game.create
    when '11'
      exit_app
      return
    end

    list_items(item_name(option))
    puts "Selected: List all #{item_name(option)}"
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
    # save_games
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

  def save_games
    File.open('games.txt', 'w') do |file|
      @games.each do |game|
        file.puts("#{game.title}, #{game.platform}, #{game.release_year}")
      end
    end
  end

  private

  def list_authors(_books, _music_albums, _games)
    authors = []
    @books.each do |book|
      authors << book.author
    end

    @music_albums.each do |music_album|
      authors << music_album.author
    end

    @games.each do |game|
      authors << game.author
    end
    authors.each_with_index do |author, index|
      puts "[#{index + 1}] (ID: #{author.id}) Name: #{author.last_name.upcase}, #{author.first_name}"
    end
  end

  def list_games
    puts 'List of all games'
    @games.each_with_index do |game, index|
      puts "\n[#{index + 1}] (ID:#{game.id})
        This game by #{game.author.last_name.upcase} has been published in '#{game.publish_date}'"
    end
  end
end

app = App.new
app.run

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
    if option == '11'
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
    save_games
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
end

app = App.new
app.run

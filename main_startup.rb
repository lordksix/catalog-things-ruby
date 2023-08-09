require_relative 'src/book'
require_relative 'src/label'

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
    when '1'
      list_books

    when '5'
      list_labels @books, @music_albums, @games
    when '8'
      @books << add_books
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
    # save_books
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

def list_books
  @books.each_with_index do |book, index|
    puts "\n[#{index + 1}] (ID:#{book.id}) The book: #{book.label.title} has been published in #{book.publish_date}"
  end
end

def add_books
  label_title, label_color, publisher, book_date, cover_state = book_details

  new_book = Book.new(cover_state, publisher, book_date)
  puts "The book '#{cover_state.upcase}' by #{publisher.upcase} was created successfully!"

  new_label = Label.new(label_title, label_color)
  new_label.add_item(new_book)

  new_book
end

private

def book_details
  print 'Enter Title of the Book: '
  label_title = gets.chomp
  print 'Type the color of the Book: '
  label_color = gets.chomp
  print "\nWhat's the name of the publisher?"
  print "\nAnswer: "
  publisher = gets.chomp
  print 'What\s the publishing date? [year]'
  print "\nAnswer: "
  book_date = gets.chomp.to_i
  print "What's the cover state of the book? [good/bad] "
  cover_state = gets.chomp.downcase

  [label_title, label_color, publisher, book_date, cover_state]
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

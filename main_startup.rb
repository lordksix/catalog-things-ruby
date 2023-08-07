class App
  def initialize
    @books = []
    @music_albums = []
    @games = []
    @genres = [Genre.new('Blues'), Genre.new('Classical Music'), Genre.new('Hip hop'), Genre.new('Rap'),
               Genre.new('Pop'), Genre.new('House')]

    @choice_list = {
      '1' => 'Create an Item',
      '2' => 'List all items.',
      '3' => 'List all genres.',
      '4' => 'List all labels.',
      '5' => 'List all authors.',
      '6' => 'Exit'
    }
  end

  def run
    parse_music_albums
    parse_book
    parse_game
    puts 'Welcome to the Catalog of your Things'

    loop do
      puts 'Please choose your option by entering a number:'

      @choice_list.each do |key, value|
        puts "#{key} - #{value}"
      end
      print 'Your option ==> '
      option = gets.chomp
      if option == '6'
        exit_app
        break
      end

      handle_option(option)
    end
  end

  def handle_option(option)
    case option
    when '1'
      create_item
    when '2'
      list_items
    when '3'
      list_genres
    when '4'
      list_label
    else
      puts 'That is not a valid option'
    end
  end

  def exit_app
    save_music_albums
    save_book
    save_game
    puts ' Thank you for using this app'
  end
end

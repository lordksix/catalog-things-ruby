class App
  def initialize
    @books = []
    @music_albums = []
    @games = []

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
      puts 'Selected: Create an Item'
    when '2'
      list_items
      puts 'Selected: List all items'
    when '3'
      list_genres
      puts 'Selected: List all genres'
    when '4'
      list_label
      puts 'Selected: List all labels'
    else
      puts 'That is not a valid option'
    end
  end

  def create_item
    puts 'Creating an item'
  end

  def list_items
    puts 'Listing all items'
  end

  def list_genres
    puts 'Listing all genres'
  end

  def list_label
    puts 'Listing all label'
  end

  def exit_app
    puts 'Thank you for using this app'
  end
end

app = App.new
app.run

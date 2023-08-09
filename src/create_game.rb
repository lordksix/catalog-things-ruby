require_relative 'game'
require_relative 'author'

class CreateGame
  def initialize(items)
    @games = items
  end

  def create
    add_game
  end

  private

  def add_game
    puts "Input game's information"
    author = author_details
    game = game_details
    new_game = Game.new(game[0], game[1], game[2])
    new_author = Author.new(author[0], author[0])
    new_author.add_item(new_game)
    @games << new_game
    puts "Game by '#{author[0]} #{author[1]}' published in #{game[0]} was added successfully!"
  end

  def author_details
    puts "Enter author's first name:"
    first_name = gets.chomp
    while first_name.nil?
      puts "Enter author's first name:"
      first_name = gets.chomp
    end
    puts "Enter author's last name:"
    last_name = gets.chomp
    while last_name.nil?
      puts "Enter author's last name:"
      last_name = gets.chomp
    end
    [first_name, last_name]
  end

  def game_details
    publish_date = get_year("Enter game's year of publication:")
    last_played_at = get_year('Enter last time (year) it was played:')
    puts 'Is it Multiplayer? (Y/N)'
    multiplayer = gets.chomp.downcase
    while multiplayer != 'y' && multiplayer != 'n'
      puts 'Is it Multiplayer? (Y/N)'
      multiplayer = gets.chomp.downcase
    end
    [publish_date, multiplayer == 'y', last_played_at]
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

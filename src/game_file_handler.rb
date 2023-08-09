require_relative 'game'
require_relative 'author'

class GamesFilesHandler
  def initialize(games)
    @games = games
  end

  def save_games
    File.write('games.json', save_attr('games', @games))
  end

  def parse_games
    parse_games = []
    temp_games = begin
      JSON.parse(JSON.parse(File.read('games.json'))['games'])
    rescue StandardError
      []
    end
    if temp_games.empty?
      parse_games = temp_books
    else
      temp_games.each do |game|
        temp_game = Game.new(game['publish_date'], game['publish_date'], game['last_played_at'])
        temp_author = Author.new(game['first_name'], game['last_name'])
        temp_author.add_item(temp_game)
        parse_games << temp_game
      end
    end
    parse_games
  end

  private

  def save_attr(item, array_items)
    JSON.dump({ item => array_items.to_json })
  end
end

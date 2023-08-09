require_relative 'game'

class Author
  def initialize(first_name, last_name)
    @id = rand(1_000_000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_author(self)
  end
end

newauthor = Author.new('andres', 'maldonado')
newgame = Game.new(2015, true, 2020)
newauthor.add_item(newgame)

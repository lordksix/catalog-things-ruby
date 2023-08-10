class Genre
  attr_reader :name, :id
  attr_accessor :items, :genre

  def initialize(name)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_genre(self)
  end
end

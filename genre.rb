class Genre
  attr_accessor :name, :items

  def initialize(name)
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.genre = self if item.respond_to?(:genre=)
  end

  def self.find_genre_by_name(name, genres)
    genres.find { |genre| genre.name == name }
  end
end

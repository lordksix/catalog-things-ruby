class Label
  attr_accessor :title, :color, :items
  attr_reader :id

  def initialize(title, color, id = nil)
    @id = id || rand(1_000_000_000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_label(self)
  end
end

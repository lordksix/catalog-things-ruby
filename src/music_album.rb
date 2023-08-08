require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(title, on_spotify)
    super(title)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end

  def to_json(*_args)
    {
      'title' => @title,
      'on_spotify' => @on_spotify
    }
  end

  def self.from_json(json_data)
    MusicAlbum.new(json_data['title'], json_data['on_spotify'])
  end
end

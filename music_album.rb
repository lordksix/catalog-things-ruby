require_relative 'item_music'

class MusicAlbum < Item
  attr_accessor :on_spotify, :release_year, :artist

  def initialize(title, artist, release_year)
    super(title)
    @artist = artist
    @release_year = release_year
    @on_spotify = false
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

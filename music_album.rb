require_relative 'item'

class MusicAlbum
  attr_accessor :on_spotify, :release_year, :genre, :name

  def initialize(name, release_year)
    @name = name
    @release_year = release_year
    @on_spotify = false
  end

  def can_be_archived?
    super_can_be_archived? && @on_spotify
  end

  def to_json(*_args)
    {
      'name' => @name,
      'release_year' => @release_year,
      'on_spotify' => @on_spotify,
      'genre' => @genre.name
    }
  end

  def add_genre(genre)
    @genre = genre
  end

  def self.from_json(json_data, genres)
    genre_name = json_data['genre']
    matched_genre = genres.find { |genre_item| genre_item.name == genre_name }

    MusicAlbum.new(json_data['name'], json_data['release_year']).tap do |album|
      album.on_spotify = json_data['on_spotify']
      album.add_genre(matched_genre) if matched_genre
    end
  end
end

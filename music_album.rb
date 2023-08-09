require_relative 'item'

class MusicAlbum
  attr_accessor :on_spotify, :release_year, :artist, :title, :genre

  def initialize(title, artist, release_year)
    @title = title
    @artist = artist
    @release_year = release_year
    @on_spotify = false
  end

  def can_be_archived?
    super_can_be_archived? && @on_spotify
  end

  def to_json(*_args)
    {
      'title' => @title,
      'artist' => @artist,
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

    MusicAlbum.new(json_data['title'], json_data['artist'], json_data['release_year']).tap do |album|
      album.on_spotify = json_data['on_spotify']
      album.add_genre(matched_genre) if matched_genre
    end
  end
end

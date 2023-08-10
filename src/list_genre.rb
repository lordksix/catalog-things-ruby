class ListGenreHandler
  def initialize(books, music_albums, games)
    @books = books
    @music_albums = music_albums
    @games = games
  end

  def handle
    list_genre_create
  end

  private

  def list_genre_create
    puts 'List of Genres:'
    genres = []
    @music_albums.each do |music_album|
      genres << music_album.genre
    end

    genres.each_with_index do |genre, index|
      puts "[#{index + 1}] (ID: #{genre.id}) Genre: #{genre.name}"
    end
  end
end

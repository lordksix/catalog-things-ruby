class DisplayGenres
  def initialize(_books, music_albums, genres)
    @books = Books
    @music_albums = music_albums
    @genres = genres
  end

  def display_all_genres
    @books.each do |book|
      genres << book.genre
    end

    @music_albums.each do |music_album|
      genres << music_album.genre
    end

    @games.each do |game|
      genres << game.genre
    end

    @genres.each_with_index do |genre, index|
      puts "#{index}) Genre Name: #{genre.name}"
    end
  end
end

display_genres = DisplayGenres.new(genres)
display_genres.display_all_genres

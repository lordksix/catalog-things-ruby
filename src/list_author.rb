class ListAuthorHandler
  def initialize(books, music_albums, games)
    @books = books
    @music_albums = music_albums
    @games = games
  end

  def handle
    list_author_create
  end

  private

  def list_author_create
    puts 'List of Authors:'
    authors = []
    @books.each do |book|
      authors << book.author
    end

    @music_albums.each do |music_album|
      authors << music_album.author
    end

    @games.each do |game|
      authors << game.author
    end

    authors.each_with_index do |author, index|
      puts "[#{index + 1}] (ID: #{author.id}) Name: #{author.last_name.upcase}, #{author.first_name}"
    end
  end
end

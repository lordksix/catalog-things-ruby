class ListLabelHandler
  def initialize(books, music_albums, games)
    @books = books
    @music_albums = music_albums
    @games = games
  end

  def handle
    list_label_create
  end

  private

  def list_label_create
    puts 'List of Labels:'
    labels = []
    @books.each do |book|
      labels << book.label
    end

    labels.each_with_index do |label, index|
      puts "[#{index + 1}] (ID: #{label.id}) Label: #{label.title}"
    end
  end
end

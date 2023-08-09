class DisplayGenres
  def initialize(genres)
    @genres = genres
  end

  def display_all_genres
    @genres.each_with_index do |genre, index|
      puts "#{index}) Genre Name: #{genre.name}"
    end
  end
end

display_genres = DisplayGenres.new(genres)
display_genres.display_all_genres

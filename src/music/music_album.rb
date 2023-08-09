require_relative '../../item'

class MusicAlbum < Items
  attr_reader :on_spotify, :publish_date
  attr_accessor :genre

  def initialize(on_spotify, publish_date)
    super(publish_date)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    super() && @on_spotify
  end
end

music = MusicAlbum.new(true, 2000)
puts music.move_to_archive

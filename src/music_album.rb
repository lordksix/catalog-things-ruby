require_relative '../item'

class MusicAlbum < Items
  attr_reader :on_spotify, :publish_date

  def initialize(on_spotify, publish_date, id = nil)
    super(publish_date, id)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    super() && @on_spotify
  end
end

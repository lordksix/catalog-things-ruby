require_relative '../item'

class Game < Items
  def initialize(publish_date, archived, multiplayer, last_played_at)
    super(publish_date, archived)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  private

  def can_be_archieved?
    can_be_archieved? && Time.new.year - last_played_at > 2
  end
end

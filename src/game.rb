require_relative '../item'

class Game < Items
  attr_reader :multiplayer, :last_played_at

  def initialize(publish_date, multiplayer, last_played_at, id = nil)
    super(publish_date, id)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def to_hash
    {
      id: @id,
      multiplayer: @multiplayer,
      publish_date: @publish_date,
      archived: @archived,
      last_played_at: @last_played_at,
      first_name: @author.first_name,
      last_name: @author.last_name
    }
  end

  def to_json(*_args)
    to_hash.to_json
  end

  private

  def can_be_archived?
    super && Time.new.year - @last_played_at > 2
  end
end

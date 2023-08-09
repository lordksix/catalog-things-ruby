require_relative '../item'
require_relative 'label'

class Book < Items
  attr_accessor :publisher, :cover_state

  def initialize(cover_state, publisher, publish_date)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_achieved?
    super || cover_state == 'bad'
  end
end

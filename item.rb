class Item
  attr_reader :genre, :author, :label, :publish_date, :title

  def initialize(publish_date, archived, title)
    @title = title
    @label = nil
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = archived
  end

  def add_genre(genre)
    @genre = genre
  end

  def add_author(author)
    @author = author
  end

  def add_label(label)
    @label = label
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    Time.new.year - publish_date > 10
  end
end

class Items
  attr_reader :genre, :author, :source, :label, :publish_date

  def initialize(publish_date, archived)
    @id = Random.rand(1..1000)
    @genre = []
    @author = []
    @source = []
    @label = []
    @publish_date = publish_date
    @archived = archived
  end
end

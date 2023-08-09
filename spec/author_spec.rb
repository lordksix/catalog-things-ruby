require_relative '../src/game'
require_relative '../src/author'

describe Author do
  let(:game20002020) { Game.new(2000, false, 2020) }
  let(:author1) { Author.new('John', 'Doe') }
  let(:author2) { Author.new('Jane', 'Doe') }

  describe '#initialize' do
    it 'creates a author with a first' do
      expect(author1).to be_instance_of(Author)
      expect(author1.first_name).to eql('John')
      expect(author2.first_name).to eql('Jane')
    end

    it 'creates a author with a first' do
      expect(author2).to be_instance_of(Author)
      expect(author1.last_name).to eql('Doe')
      expect(author2.last_name).to eql('Doe')
    end

    it 'creates a author with an empty Items property' do
      expect(author1.items.length).to eql 0
      expect(author2.items.length).to eql 0
    end
  end

  describe '#add_item' do
    it 'Add game to items property in author class' do
      author1.add_item(game20002020)
      author2.add_item(game20002020)
      expect(author1.items.length).to eql 1
      expect(author2.items.length).to eql 1
    end
  end
end

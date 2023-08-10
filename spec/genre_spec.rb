require_relative '../src/genre'

describe Genre do
  let(:name) { 'Rock' }

  subject { described_class.new(name) }

  describe '#initialize' do
    it 'sets the name correctly' do
      expect(subject.name).to eq(name)
    end

    it 'generates a random id' do
      expect(subject.id).to be_an(Integer)
    end

    it 'initializes items as an empty array' do
      expect(subject.items).to be_empty
    end
  end

  describe '#add_item' do
    it 'adds an item to the genre and sets genre for the item' do
      item = double('Item')
      expect(item).to receive(:add_genre).with(subject)

      subject.add_item(item)

      expect(subject.items).to include(item)
    end
  end
end

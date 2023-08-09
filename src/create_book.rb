require_relative 'book'
require_relative 'label'
require_relative 'input_data'

class CreateBook < InputData
  def initialize(items)
    super()
    @books = items
  end

  def create
    add_book
  end

  private

  def add_book
    puts "Input game's information"
    label = label_details
    book = book_details
    new_book = Book.new(book[0], book[1], book[2])
    new_label = Label.new(label[0], label[1])
    new_label.add_item(new_book)
    @books << new_book
    puts 'The book  was created successfully!'
  end

  def book_details
    print "\nWhat's the name of the publisher?"
    print "\nAnswer: "
    publisher = gets.chomp
    print 'What\s the publishing date? [year]'
    print "\nAnswer: "
    book_date = gets.chomp.to_i
    print "What's the cover state of the book? [good/bad] "
    cover_state = gets.chomp.downcase
    [cover_state, publisher, book_date]
  end

  def get_year(msg)
    puts msg
    year = gets.chomp.to_i
    while year < 1000 || year > 2500
      puts msg
      year = gets.chomp.to_i
    end
    year
  end
end

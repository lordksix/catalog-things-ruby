require_relative '../item'
require_relative 'label'

class Book < Items
  attr_accessor :publisher, :cover_state

  def initialize(cover_state, publisher, *args)
    super(*args)
    @publisher = publisher
    @cover_state = cover_state
  end

  def self.list_books(books)
    books.each_with_index do |book, index|
      puts "\n[#{index + 1}] (ID:#{book.id}) The book: #{book.label.title} has been published in #{book.publish_date}"
    end
  end

  def self.add_book
    label_title, label_color, publisher, book_date, cover_state = book_details

    new_book = Book.new(cover_state, publisher, book_date)
    puts "The book '#{cover_state.upcase}' by #{publisher.upcase} was created successfully!"

    new_label = Label.new(label_title, label_color)
    new_label.add_item(new_book)

    new_book
  end

  private_class_method def self.book_details
    print 'Enter Title of the Book: '
    label_title = gets.chomp
    print 'Type the color of the Book: '
    label_color = gets.chomp
    print "\nWhat's the name of the publisher?"
    print "\nAnswer: "
    publisher = gets.chomp
    print 'What\s the publishing date? [year]'
    print "\nAnswer: "
    book_date = gets.chomp.to_i
    print "What's the cover state of the book? [good/bad] "
    cover_state = gets.chomp.downcase

    [label_title, label_color, publisher, book_date, cover_state]
  end

  def can_be_achieved?
    super || cover_state == 'bad'
  end
end

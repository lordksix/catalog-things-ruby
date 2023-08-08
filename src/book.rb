require_relative '../item'
require_relative 'label'
# require_relative './author'
# require_relative './source'
# require_relative './genre'

class Book < Items
  attr_accessor :publisher, :cover_state

  def initialize(cover_state, publisher, *args)
    super(*args)
    @publisher = publisher
    @cover_state = cover_state
  end

  def self.list_books(books)
    index = 1
    puts '1'
    p books
    books.each do |book|
      puts "\n[#{index}] (ID:#{book.id}) The book: #{book.label.title}  has been published in #{book.publish_date}"
      index += 1
    end
  end

  def self.add_book
    print 'Enter Title of the Book: '
    label_title = gets.chomp
    print 'Type the color of the Book: '
    label_color = gets.chomp
    # print 'Author\'s first name: '
    # author_first_name = gets.chomp
    # print 'Author\'s last name: '
    # author_last_name = gets.chomp
    # print 'Enter the book\'s genre: '
    # genre_name = gets.chomp
    # print 'Enter the source of this book: '
    # source_name = gets.chomp
    print "\nWhat's the name of the publisher?"
    print "\nAnswer: "
    publisher = gets.chomp
    print 'What\s the publishing date? [year]'
    print "\nAnswer: "
    book_date = gets.chomp.to_i
    print "What's the cover state of the book? [good/bad] "
    cover_state = gets.chomp.downcase

    puts 'a'

    new_book = Book.new(cover_state, publisher, book_date)
    puts "The book '#{cover_state.upcase}' by #{publisher.upcase} was created successfully!"

    puts 'b'

    new_label = Label.new(label_title, label_color)
    new_label.add_item(new_book)

    # new_author = Author.new(author_first_name, author_last_name)
    # new_author.add_item(new_book)

    # new_genre = Genre.new(genre_name)
    # new_genre.add_item(new_book)

    # new_source = Source.new(source_name)
    # new_source.add_item(new_book)


    new_book
  end



  private

  # def can_be_achieved?
  #   if super | cover_state == 'bad'
  #     return true
  #   end
  #   false
  # end

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end

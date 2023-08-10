class InputData
  def author_details
    puts "Enter author's first name:"
    first_name = gets.chomp
    while first_name.nil?
      puts "Enter author's first name:"
      first_name = gets.chomp
    end
    puts "Enter author's last name:"
    last_name = gets.chomp
    while last_name.nil?
      puts "Enter author's last name:"
      last_name = gets.chomp
    end
    [first_name, last_name]
  end

  def label_details
    print 'Enter Title of the Book: '
    label_title = gets.chomp
    print 'Type the color of the Book: '
    label_color = gets.chomp
    [label_title, label_color]
  end

  def genre_details
    print 'Enter the music album\'s genre: '
    genre_name = gets.chomp
    [genre_name]
  end
end

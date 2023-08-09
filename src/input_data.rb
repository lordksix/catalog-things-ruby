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
end

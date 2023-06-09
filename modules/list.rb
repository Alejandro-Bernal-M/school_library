module List
  def list_all_rentals_for_id
    puts 'Select a Person by the ID'
    @people.each { |person| puts "Name: #{person.name}, Age: #{person.age}, id: #{person.id}" }
    print 'Write the id of the person: '
    id = gets.chomp.to_i

    rentals_to_show = []
    @rentals.each do |rental|
      rentals_to_show << rental if rental.person.id == id
    end

    if rentals_to_show.empty?
      puts 'No rentals'
    else
      rentals_to_show.each { |rental| puts "Book title: #{rental.book.title}, Date of rental: #{rental.date}" }
    end
  end

  def list_all_people
    puts 'No people yet, please create a person first' if @people.empty?
    people.each { |person| puts "Name: #{person.name},  Id: #{person.id}" }
  end

  def list_all_books
    puts 'No books yet, please create one' if @books.empty?
    books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end
end

require './book'
require './student'
require './teacher'
require './rental'
require './person'

class App
  attr_reader :people, :books

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def run
    show_menu
    puts 'Thank you for using this app!' if @number.to_i == 7
  end

  def create_person
    print 'Please choose 1 for create a student or 2 for create a teacher: '
    teacher_or_student = gets.chomp.to_i
    case teacher_or_student
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid option, try again'
      create_person
    end
  end

  def create_student
    print 'Age?: '
    age = gets.chomp.to_i
    print 'Name?: '
    name = gets.chomp
    print 'Has parent permission?[Y/N]: '
    parent_permission = gets.chomp
    case parent_permission
    when 'y' || 'Y'
      new_student = Student.new(name, age, true)
      @people << new_student
      puts 'Person created sucessfully'
    when 'n' || 'N'
      new_student = Student.new(age, name, false)
      @people << new_student
      puts 'Person created sucessfully'
    else
      puts 'Invalid, please try again'
      create_student
    end
  end

  def create_teacher
    print 'Age?: '
    age = gets.chomp.to_i
    print 'Name?: '
    name = gets.chomp
    print 'Specialization?: '
    specialization = gets.chomp
    new_teacher = Teacher.new(age, specialization, name)
    @people << new_teacher
    puts 'Person created sucessfully'
  end
  
  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    new_book = Book.new(title, author)
    @books << new_book
    puts "Book #{title} created succesfully"
  end

  def create_rental
    if @books.empty? || @people.empty?
      puts 'You need a book and a person to create a new renta, please add both first'
    else
      puts 'Select a book by title'
      @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
      print 'Write the title of the book that you want: '
      book_title = gets.chomp
      book = @books.select { |b| b.title == book_title }
      puts 'Select the person who is renting the book by the ID'
      @people.each { |person| puts "Name: #{person.name}, Age: #{person.age}, id: #{person.id}" }
      person_id = gets.chomp.to_i
      person = @people.select { |per| per.id == person_id }
      print 'Please enter a date in the next format yyyy-mm-dd: '
      date = gets.chomp
      new_rental = Rental.new(date, book[0], person[0])
      @rentals << new_rental
      puts 'Rental created succesfully'
    end
  end

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

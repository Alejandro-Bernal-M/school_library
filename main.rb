require './app'

def main
  puts 'Welcome to school library app!'
  app = App.new
  app.run
end

def options
  case @number.to_i
  when 1
    list_all_books
    show_menu
  when 2
    list_all_people
    show_menu
  when 3
    create_person
    show_menu
  when 4
    create_book
    show_menu
  when 5
    create_rental
    show_menu
  when 6
    list_all_rentals_for_id
    show_menu
  end
end

def show_menu
  puts ''
  puts 'Please choose an option by entering a number:'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person ID'
  puts '7 - Exit'
  @number = gets
  until @number.to_i.between?(1, 7)
    puts 'Please write a number between 1 and 7'
    @number = gets
  end
  options
end

main

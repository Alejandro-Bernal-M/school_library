# testing for associations

require './book'
require './rental'
require './student'
require './person'
require './classroom'

person1 = Person.new(26, 'alejo')
person2 = Person.new(20, 'maria')
puts person1.name

book1 = Book.new('thrones', 'george')
book2 = Book.new('the old and the sea', 'hernest')

Rental.new('2023-06-17', book1, person1)
Rental.new('2023-06-10', book1, person2)
Rental.new('2023-06-10', book2, person2)

puts person1.rentals.count
puts(book1.rentals.map { |rental| rental.person.name })

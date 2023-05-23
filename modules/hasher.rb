module Hasher
def person_to_hash person
  array_of_rentals = []
  person.rentals.each { |rental| array_of_rentals << rental_to_hash rental}
  if person.class == Student
  {
    id: person.id,
    age: person.age,
    name: person.name,
    parent_permission: person.parent_permission,
    classroom: person.classroom
    rentals:  array_of_rentals
  }
  else
  {
    id: person.id,
    age: person.age,
    name: person.name,
    specialization: person.specialization
    rentals:  array_of_rentals
  }
  end
end

def book_to_hash book
  array_of_rentals = []
  book.rentals.each { |rental| array_of_rentals << rental_to_hash rental}
  {
    title: book.title,
    author: book.author,
    rentals:  array_of_rentals
  }
end

def rental_to_hash rental
  {
    date: rental.date,
    book: rental.book,
    person: rental.person
  }
end
end
module Hasher
def person_to_hash person
  if person.class == Student
  {
    id: person.id,
    age: person.age,
    name: person.name,
    parent_permission: person.parent_permission,
    classroom: person.classroom
  }
  else
  {
    id: person.id,
    age: person.age,
    name: person.name,
    specialization: person.specialization
  }
  end
end

def book_to_hash book
  {
    id: book.id,
    title: book.title,
    author: book.author
  }
end

def rental_to_hash rental
  {
    date: rental.date,
    book: rental.book.id,
    person: rental.person.id
  }
end
end
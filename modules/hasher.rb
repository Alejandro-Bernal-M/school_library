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
    title: book.title,
    author: book.author
  }
end


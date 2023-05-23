require 'json'

module Store
  def save_persons
    File.write('data/people.json', @people.map { |person| person_to_hash person }.to_json)
  end

  def save_books
    File.write('data/books.json', @books.map { |book| book_to_hash book }.to_json)
  end

  def save_rentals
    File.write('data/rentals.json', @rentals.map { |rental| rental_to_hash rental }.to_json)
  end

  def save_files
    save_persons
    save_books
    save_rentals
  end

  def load_persons
    return unless File.exist?('data/people.json') && File.size?('data/people.json')

    JSON.parse(File.read('data/people.json')).each do |person|
      @people << if person.key?('classroom')
                   Student.new(person['age'], person['name'], person['parent_permission'])
                 else
                   Teacher.new(person['age'], person['specialization'], person['name'])
                 end
    end
  end

  def load_books
    return unless File.exist?('data/books.json') && File.size?('data/books.json')

    JSON.parse(File.read('data/books.json')).each do |book|
      @books << Book.new(book['title'], book['author'])
    end
  end

  def get_book(rental)
    books = JSON.parse(File.read('data/books.json'))
    book_hash = books.select { |b| b['id'] == rental['book'] }
    book_title = book_hash[0]['title']
    book = @books.select { |b| b.title == book_title }
    book[0]
  end

  def get_person(rental)
    persons = JSON.parse(File.read('data/people.json'))
    person_hash = persons.select { |p| p['id'] == rental['person'] }
    person_name = person_hash[0]['name']
    person = @people.select { |p| p.name == person_name }
    person[0]
  end

  def load_rentals
    return unless File.exist?('data/rentals.json') && File.size?('data/rentals.json')

    JSON.parse(File.read('data/rentals.json')).each do |rental|
      @rentals << Rental.new(rental['date'], get_book(rental), get_person(rental))
    end
  end

  def load_files
    load_persons
    load_books
    load_rentals
  end
end

require 'json'

module Store
  def save_persons
    File.open('data/people.json', 'w') do |f|
      f.write @people.map { |person| person_to_hash person }.to_json
    end
  end

  def save_books
    File.open('data/books.json', 'w')  do |f|
      f.write @books.map { |book| book_to_hash book }.to_json
    end
  end

  def save_rentals
    File.open('data/rentals.json', 'w') do |f|
      f.write @rentals.map { |rental| rental_to_hash rental}.to_json
    end
  end

  def load_persons
    if File.exist?('data/people.json') && File.size?('data/people.json')
      JSON.parse(File.read('data/people.json')).each do |person|
        if person.key?('classroom')
          @people << Student.new(person['age'], person['name'], person['parent_permission'])
        else
          @people << Teacher.new(person['age'], person['specialization'], person['name'])
        end
      end
    end
  end
  
end
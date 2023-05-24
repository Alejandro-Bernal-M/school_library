require_relative '../classes/rental'

class Person
  attr_accessor :name, :age
  attr_reader :id, :rentals, :parent_permission

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    super()
    @rentals = []
  end
end

class Book
  attr_accessor :title, :author, :rentals
  attr_reader :id

  def initialize(title, author)
    @id = Random.rand(1..1000)
    @title = title
    @author = author
    @rentals = []
  end
end

describe Rental do
  person = Person.new(20)
  book = Book.new('Title','Author')
  rental = Rental.new('2023-02-08', book, person)
  context 'Testing the Rental class' do
    it 'creating an instance of the rental class' do
      expect(rental).to be_instance_of(Rental)
    end
    it 'creating an instance of the rental class adds itself to objects person and book' do
      expect(person.rentals[0]).to eq(rental)
      expect(book.rentals[0]).to eq(rental)
    end
    it 'rental.date returns the date' do
      expect(rental.date).to eq('2023-02-08')
    end
    it 'rental.book.title returns the title of the book' do
      expect(rental.book.title).to eq('Title')
    end
    it 'rental.person.name returns the name of the person' do
      expect(rental.person.name).to eq('Unknown')
    end
  end
end
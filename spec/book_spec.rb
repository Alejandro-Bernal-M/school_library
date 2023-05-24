require_relative '../classes/book'

describe Book do
  let(:book) { Book.new('Title', 'Author') }

  context 'when initialize' do
    it 'sets the title and author' do
      expect(book.title).to eq('Title')
      expect(book.author).to eq('Author')
    end

    it 'generates a random id between 1 and 1000' do
      expect(book.id).to be_between(1, 1000)
    end

    it 'create an empty array for rentals' do
      expect(book.rentals).to be_empty
    end
  end

  context 'when testing attr_accesor' do
    it 'should change the title' do
      book.title = 'New title'
      expect(book.title).to eq('New title')
    end

    it 'should change the author' do
      book.author = 'New author'
      expect(book.author).to eq('New author')
    end

    it 'should accept a new rental' do
      rental = double('Rental')
      book.rentals << rental
      expect(book.rentals).to include(rental)
    end
  end
end

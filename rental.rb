class Rental
  attr_accessor :date

  def initialize(date, book, student)
    @date = date
    @book = book
    book.visits.push(self)
    @student = student
    student.visits.push(self)
  end
end

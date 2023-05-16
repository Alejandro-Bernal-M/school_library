require './nameable'
require './capitalize'
require './trimmer'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id
  
  def initialize(age, name = 'unknow', parent_permission: true)
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end
  
  def correct_name
    @name
  end

  def of_age?
    return true unless @age < 18

    false
  end

  def can_use_services?
    return true if of_age? || @parent_permission

    false
  end

  private :of_age?
end

person = Person.new(22, 'maximilianus')
person.correct_name
capitalizedPerson = CapitalizeDecorator.new(person)
puts capitalizedPerson.correct_name
capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
puts capitalizedTrimmedPerson.correct_name




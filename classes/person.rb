require_relative 'nameable'
require_relative 'capitalize'
require_relative 'trimmer'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rentals

  def initialize(age, name = 'unknow', parent_permission: true)
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
    super()
    @rentals = []
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

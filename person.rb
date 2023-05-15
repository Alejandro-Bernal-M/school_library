class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'unknow', parent_permission: true)
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
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

person1 = Person.new(26, 'alejandro')
puts(person1.name)
puts person1.can_use_services?

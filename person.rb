class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'unknow', parent_permission: true)
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end
end

person1 = Person.new(26, 'alejandro')
puts(person1.name)

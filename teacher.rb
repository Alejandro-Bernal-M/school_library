require './person'

class Teacher < Person
  attr_accessor :name

  def initialize(age, specialization, name = 'unknow', parent_permission: true)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

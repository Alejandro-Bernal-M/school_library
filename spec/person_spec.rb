require_relative '../classes/person'

describe Person do
  person1 = Person.new(11, 'Carlos')
  person2 = Person.new(22)
  person3 = Person.new(11, 'Carlos', parent_permission: false)
  person4 = Person.new(22, 'Carlos', parent_permission: false)
  context 'Test the Person class' do
    it 'create an instance object of Person' do
      expect(person1).to be_instance_of(Person)
    end
    it 'return unknown if the name is not given' do
      expect(person2.name).to eq('Unknown')
    end
    it 'return the name if the name is given' do
      expect(person1.name).to eq('Carlos')
    end
    it 'return the age' do
      expect(person1.age).to eq(11)
    end
    it 'return the parent permission = true if not given' do
      expect(person1.parent_permission).to eq(true)
    end
    it 'return the parent permission = false if given' do
      expect(person3.parent_permission).to eq(false)
    end
    it 'return can_use_service = true if the person has parent_permission = true and under age' do
      expect(person1.can_use_services?).to eq(true)
    end
    it 'return can_use_service = true if the person has parent_permission = false and over age' do
      expect(person4.can_use_services?).to eq(true)
    end
    it 'return can_use_service = false if the person has parent_permission = false and under age' do
      expect(person3.can_use_services?).to eq(false)
    end
    it 'correct_name method expected to return the name' do
      expect(person1.correct_name).to eq('Carlos')
    end
    it 'rentals method expected to return the rentals = 0 if empty' do
      expect(person1.rentals.length).to eq(0)
    end
    it 'rentals method expected to return the rentals = 3 if having 3 items' do
      person1.rentals.push('rent', 'rent', 'rent')
      expect(person1.rentals.length).to eq(3)
    end
  end
end

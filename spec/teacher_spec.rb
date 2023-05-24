require_relative '../classes/teacher'

describe Teacher do
  context 'When testing the Student class' do
    teacher = Teacher.new(45, 'Front-end dev', 'Rigoberto')
    it "should say 'Teacher initialized'" do
      expect(teacher.age).to eq(45)
      expect(teacher.specialization).to eq('Front-end dev')
      expect(teacher.name).to eq('Rigoberto')
    end
    it 'Can_use_services Method return true' do
      expect(teacher.can_use_services?).to eq(true)
    end
  end
end

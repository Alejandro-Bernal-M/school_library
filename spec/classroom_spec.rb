require_relative '../classes/classroom'

describe Classroom do
  let(:classroom) { Classroom.new('A1') }

  describe 'When initialize' do
    it 'should initialize with correct label' do
      expect(classroom.label).to eq('A1')
    end

    it 'should create an empty array of students' do
      expect(classroom.students).to be_empty
    end
  end

  describe 'When saving students' do
    let(:student) { double('Student') }
    it 'saves a new student on the array' do
      allow(student).to receive(:classroom=)
      classroom.add_student(student)
      expect(classroom.students).to include(student)
    end
  end
end

require_relative '../classes/student'
require_relative '../classes/classroom'

describe Student do
  context 'When testing the Student class' do
    student = Student.new(23, 'Luis', true)
    classroom = Classroom.new('Math')
    it "should say 'student initialized'" do
      expect(student.age).to eq(23)
      expect(student.name).to eq('Luis')
      expect(student.parent_permission).to eq(true)
    end
    it 'returns the play hooky message' do
      expect(student.play_hooky).to eq('¯\(ツ)/¯')
    end
    it 'does not add the student to the classroom if already present' do
      classroom.students.push(student)
      student.classroom = classroom
      expect(classroom.students.count(student)).to eq(1)
    end
  end
end

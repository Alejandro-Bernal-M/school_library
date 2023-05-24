require_relative '../classes/student'
require_relative '../classes/classroom'

describe Student do
  context 'When testing the Student class' do
    student = Student.new(23, 'Luis', true)
    classroom = Classroom.new('Math')
    it "should return the student's age" do
      expect(student.age).to eq(23)
    end
    it "should return the student's name" do
      expect(student.name).to eq('Luis')
    end
    it "should return the student's parent permission" do
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

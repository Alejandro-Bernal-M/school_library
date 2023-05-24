require_relative '../classes/trimmer'

describe TrimmerDecorator do
  context 'When testing the Trimmer class' do
    nameable = Nameable.new
    trimmer = TrimmerDecorator.new(nameable)
    it "should say 'LuisIsTheB'" do
      allow(nameable).to receive(:correct_name).and_return('LuisIsTheBest')
      expect(trimmer.correct_name).to eq('LuisIsTheB')
    end
  end
end

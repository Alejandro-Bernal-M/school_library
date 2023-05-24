require_relative '../classes/capitalize'

describe CapitalizeDecorator do
  let(:capitalize) { CapitalizeDecorator.new('mocked') }

  before do
    allow_any_instance_of(Decorator).to receive(:correct_name).and_return('mocked name')
  end

  describe '#correct_name' do
    it 'calls the correct_name method of the Decorator class' do
      expect_any_instance_of(Decorator).to receive(:correct_name).and_return('mocked name')
      capitalize.correct_name
    end

    it 'capitalizes the result of the correct_name method' do
      expect(capitalize.correct_name).to eq('Mocked name')
    end
  end
end

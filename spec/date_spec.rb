require 'date'

describe Date do
  let(:date) { described_class.new }
  describe '#formatted_current_date' do
    it 'return only the day, month and year' do
      expect(date.formatted_current_date).to eq (Time.now + 1800).strftime('%d/%m/%Y')
    end
  end
end
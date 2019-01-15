# frozen_string_literal: true.

require 'date'

describe Date do
  before do
    @time = Time.now
    Time.stub(:now) { @time }
  end
  let(:date) { described_class.new }

  describe '#format_date' do
    it 'return only the day, month and year' do
      expect(date.format_date(Time.now)).to eq Time.now.strftime('%d/%m/%Y')
    end
  end
end

require 'transactions'

describe Transactions do
  before do
    @time = Time.now.strftime('%d/%m/%Y')
    allow(Time).to receive(:now).and_return(@time)
  end

  let(:transactions) { described_class.new }

  describe '#store_credit_transaction' do
    it 'will store a credit transaction' do
      expect(transactions.store_credit_transaction(@time, format('%.2f', 20), format('%.2f', 20))).to eq [{ date: "#{@time}", credit: "20.00", debit: nil, balance: "20.00" }]
    end
  end

  describe '#store_debit_transaction' do
    it 'will store a debit transaction' do
      expect(transactions.store_debit_transaction(@time, format('%.2f', 20), format('%.2f', 20))).to eq [{ date: "#{@time}", credit: nil, debit: "20.00", balance: "20.00" }]
    end
  end
end

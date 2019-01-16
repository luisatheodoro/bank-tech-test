feature 'Stores credit transaction' do
  before do
    @time = Time.now.strftime('%d/%m/%Y')
    allow(Time).to receive(:now).and_return(@time)
  end
  subject(:transaction) { Transactions.new }
  scenario '#store_credit_transaction is returning the transaction stored inside a hash' do
    expect(transaction.store_credit_transaction(@time, format('%.2f', 20), format('%.2f', 20))).to eq [{ date: "#{@time}", credit: "20.00", debit: nil, balance: "20.00" }]
  end
end

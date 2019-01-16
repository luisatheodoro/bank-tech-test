feature 'Stores debit transaction' do
  before do
    @time = Time.now.strftime('%d/%m/%Y')
    allow(Time).to receive(:now).and_return(@time)
  end
  subject(:transaction) { Transactions.new }
  scenario '#store_debit_transaction is returning the transaction stored inside a hash' do
    expect(transaction.store_debit_transaction(@time, format('%.2f', 20), format('%.2f', 20))).to eq [{ date: "#{@time}", credit: nil, debit: "20.00", balance: "20.00" }]
  end
end
feature 'Deposit money' do
  before do
    @time = Time.now.strftime('%d/%m/%Y')
    allow(Time).to receive(:now).and_return(@time)
  end
  subject(:account) { BankAccount.new }

  scenario 'After user deposit, the transaction will be stores inside transactions' do
    expect(account.deposit_money(20)).to eq [{ date: "#{@time}", credit: "20.00", debit: nil, balance: "20.00" }]
  end
  scenario 'User can\'t deposit amount equal zero' do
    expect { account.deposit_money(0) }.to raise_error 'You can\'t deposit negative number or 0'
  end

  scenario 'User can\'t deposit amount less than zero' do
    expect { account.deposit_money(-1) }.to raise_error 'You can\'t deposit negative number or 0'
  end
  scenario 'User can\'t type string' do
    expect { account.deposit_money('20.50') }.to raise_error 'You can\'t input other value than number'
  end
end

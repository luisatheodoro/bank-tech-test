feature 'Withdraw money' do
  before do
    @time = Time.now.strftime('%d/%m/%Y')
    allow(Time).to receive(:now).and_return(@time)
  end
  subject(:account) { BankAccount.new }

  scenario 'After user withdraw, the transaction can be seen inside transactions' do
    account.deposit_money(40)
    expect(account.withdraw_money(20)).to eq [{ date: "#{@time}", credit: "40.00", debit: nil, balance: "40.00"}, {date: "#{@time}", credit: nil, debit: "20.00", balance: "20.00"}]
  end
  scenario 'User can\'t withdraw amount equal zero' do
    expect { account.withdraw_money(0) }.to raise_error 'You can\'t deposit negative number or 0'
  end

  scenario 'User can\'t withdraw amount less than zero' do
    expect { account.withdraw_money(-1) }.to raise_error 'You can\'t deposit negative number or 0'
  end

  scenario 'User can\'t type string' do
    expect { account.withdraw_money('20.50') }.to raise_error 'You can\'t input other value than number'
  end
end

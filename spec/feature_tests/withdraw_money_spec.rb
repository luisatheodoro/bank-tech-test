feature 'Withdraw money' do
  subject(:account) { BankAccount.new }

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

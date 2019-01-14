feature 'Deposit money' do
  scenario 'Depositing money in the bank account'
  it 'will deposit the money in the bank account' do
    my_account = BankAccount.new('Luisa')
    expect { my_account.deposit_money(20) }.not_to raise_error
  end

end
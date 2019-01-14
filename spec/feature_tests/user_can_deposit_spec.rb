feature 'user can deposit' do

  it 'so that I can have my money safely stored I would like to deposit it in the bank' do
    my_account = BankAccount.new('Luisa')
    expect { my_account.deposit_money }.not_to raise_error
  end

end
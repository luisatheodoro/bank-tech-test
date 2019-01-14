feature 'Print Statement' do
  scenario 'Printing account statement'
  it 'will print all account transactions' do
    my_account = BankAccount.new('Luisa')
    my_account.deposit_money(20)
    expect { my_account.print_statement }.not_to raise_error
  end

end
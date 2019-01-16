feature 'Print Statement' do
  it 'will print all account transactions' do
    account = BankAccount.new
    account.deposit_money(20.00)
    statement = Statement.new
    expect { statement.print_statement(account) }.to output("date || credit || debit || balance\n"\
        "16/01/2019 || 20.00 ||  || 20.00\n").to_stdout
  end
end

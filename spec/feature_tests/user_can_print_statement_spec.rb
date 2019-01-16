feature 'Print Statement' do
  before do
    @time = Time.now
    allow(Time).to receive(:now).and_return(@time)
  end
  it 'will print all account transactions' do
    account = BankAccount.new
    account.deposit_money(20.00)
    account.withdraw_money(5.50)
    statement = Statement.new
    expect { statement.print_statement(account) }.to output("date || credit || debit || balance\n"\
      "#{@time.strftime('%d/%m/%Y')} ||  || 5.50 || 14.50\n"\
      "#{@time.strftime('%d/%m/%Y')} || 20.00 ||  || 20.00\n").to_stdout
  end
end

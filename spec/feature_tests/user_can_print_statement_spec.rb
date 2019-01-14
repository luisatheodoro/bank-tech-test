# frozen_string_literal: true

feature 'Print Statement' do
  scenario 'Printing account statement'
  it 'will print all account transactions' do
    luisa_account = BankAccount.new('Luisa')
    luisa_account.deposit_money(20)
    statement = Statement.new
    expect { statement.print_statement(luisa_account) }.not_to raise_error
  end
end

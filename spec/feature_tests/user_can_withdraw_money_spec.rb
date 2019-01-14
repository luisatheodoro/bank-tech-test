# frozen_string_literal: true

feature 'Withdraw money' do
  it 'will withdraw the money from the bank account' do
    my_account = BankAccount.new('Luisa')
    my_account.deposit_money(20)
    expect { my_account.withdraw_money(20) }.not_to raise_error
  end
end

# frozen_string_literal: true

feature 'Withdraw money' do
  it 'won\'t withdraw the money from the bank account' do
    my_account = BankAccount.new('Luisa')
    my_account.deposit_money(30)
    expect { my_account.withdraw_money(40) }.to raise_error
  end
end

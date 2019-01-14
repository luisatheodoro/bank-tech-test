# frozen_string_literal: true

feature 'Withdraw money' do
  it 'won\'t withdraw more than £100 per transaction' do
    my_account = BankAccount.new('Luisa')
    my_account.deposit_money(200)
    expect { my_account.withdraw_money(101) }.to raise_error
  end
end

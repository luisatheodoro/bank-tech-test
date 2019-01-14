# frozen_string_literal: true

require 'bank_account'

describe BankAccount do
  let(:luisa_account) { described_class.new('Luisa') }
  let(:date) { double :date, formatted_current_date: '10/01/2019'}

  describe '#deposit_money' do
    it 'should send a confirmation of deposit amount, date and account balance' do
    expect(luisa_account.deposit_money(20, date)).to eq 'You deposited £20 on 10/01/2019.'\
                                                  ' Your account balance is £20'
    end
  end

  describe '#withdraw money' do
    it 'should send a confirmation of withdrawal amount, date and account balance' do
      luisa_account.deposit_money(20, date)
      expect(luisa_account.withdraw_money(20, date)).to eq 'You withdraw £20 on 10/01/2019.'\
                                                     ' Your account balance is £0'
    end
    it 'should throw an error if trying to withdraw more than balance' do
      luisa_account.deposit_money(22, date)
      expect { luisa_account.withdraw_money(30, date) }.to raise_error "You don't have sufficient balance to withdraw."\
                                                                   " Your account balance is £#{luisa_account.balance}"
    end
  end
end

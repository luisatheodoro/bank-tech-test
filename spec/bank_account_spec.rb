# frozen_string_literal: true

require 'bank_account'

describe BankAccount do
  before do
    @time = Time.now
    Time.stub(:now) { @time }
  end
  let(:luisa_account) { described_class.new('Luisa') }
  let(:date) { double :date, format_date: Time.now.strftime('%d/%m/%Y') }

  describe '#deposit_money' do
    it 'should send a confirmation of deposit amount, date and account balance' do
      expect(luisa_account.deposit_money(20, Time.now)).to eq \
        "You deposited £20 on #{date.format_date}. Your account balance is £20"\
    end
  end

  describe '#withdraw money' do
    it 'should send a confirmation of withdrawal amount, date and account balance' do
      luisa_account.deposit_money(20, Time.now)
      expect(luisa_account.withdraw_money(20, Time.now)).to eq \
        "You withdraw £20 on #{date.format_date}. Your account balance is £0"
    end
    it 'should throw an error if trying to withdraw more than balance' do
      luisa_account.deposit_money(22, Time.now)
      expect { luisa_account.withdraw_money(30, Time.now) }.to raise_error \
        'You don\'t have sufficient balance to withdraw. Your account balance'\
         " is £#{luisa_account.balance}"
    end

    it 'should throw an error if trying to withdraw more than £100 per transaction' do
      luisa_account.deposit_money(200, Time.now)
      expect { luisa_account.withdraw_money(101, Time.now) }.to raise_error \
        'You can only withdraw £100 pounds per transaction'
    end
  end
end

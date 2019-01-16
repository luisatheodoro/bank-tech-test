require 'bank_account'

describe BankAccount do
  before do
    @time = Time.now.strftime('%d/%m/%Y')
    allow(Time).to receive(:now).and_return(@time)
  end

  let(:transaction) { instance_double('Transaction', date: Time.now, credit: 20.00, debit: nil, balance: 20.00) }
  let(:account) { described_class.new }



  describe '#deposit_money' do
    it 'cannot deposit negative amount' do
      expect { account.deposit_money(-20.00) }.to raise_error \
        'You can\'t deposit negative number or 0'
    end

    it 'will raise an error if typing characters' do
      expect { account.deposit_money('@£kk') }.to raise_error \
        'You can\'t input other value than number'
    end

    it 'stores the transaction inside the log' do
      expect(account.deposit_money(30.00)).to eq account.account_transactions
    end
  end

  describe '#balance' do
    it 'should add the amount deposited to the balance' do
      account.deposit_money(20.00)
      expect(account.balance).to eq 20.00
    end

    it 'should subtract the amount withdrawn to the balance' do
      account.deposit_money(30.00)
      account.withdraw_money(20.00)
      expect(account.balance).to eq 10.00
    end
  end

  describe '#withdraw money' do
    it 'cannot withdraw negative amount' do
      expect { account.withdraw_money(-20) }.to raise_error 'You can\'t deposit negative number or 0'
    end

    it 'will raise an error if typing characters' do
      expect { account.withdraw_money('@£kk') }.to raise_error 'You can\'t input other value than number'
    end

    it 'stores the transaction inside the log' do
      account.deposit_money(30.00)
      expect(account.withdraw_money(20)).to eq account.account_transactions
    end
  end
end

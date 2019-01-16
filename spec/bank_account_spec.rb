require 'bank_account'
require 'transactions'

describe BankAccount do
  before do
    @time = Time.now.strftime('%d/%m/%Y')
    allow(Time).to receive(:now).and_return(@time)
  end
  let(:transaction_1) do
    double(Transactions, transactions_log: [{ balance: '30.00', credit: format('%.2f', '30.00'), date: @time, debit: nil }])
  end
  let(:transaction_2) do
    double(Transactions, transactions_log: [{ balance: '30.00', credit: format('%.2f', '30.00'), date: @time, debit: nil },
                                            { balance: '10.00', debit: format('%.2f', '20.00'), date: @time, credit: nil }])
  end
  let(:account_1) { described_class.new(transaction_1) }
  let(:account_2) { described_class.new(transaction_2) }

  describe '#deposit_money' do
    it 'cannot deposit negative amount' do
      expect { account_1.deposit_money(-20.00) }.to raise_error \
        'You can\'t deposit negative number or 0'
    end

    it 'will raise an error if typing characters' do
      expect { account_1.deposit_money('@£kk') }.to raise_error \
        'You can\'t input other value than number'
    end

    it 'stores the transaction inside the log' do
      account_transactions = account_1.transactions
      expect(account_transactions.transactions_log).to eq [{ balance: '30.00', credit: '30.00', date: "#{@time}", debit: nil }]
    end
  end

  describe '#withdraw money' do
    it 'cannot withdraw negative amount' do
      expect { account_1.withdraw_money(-20) }.to raise_error 'You can\'t deposit negative number or 0'
    end

    it 'will raise an error if typing characters' do
      expect { account_1.withdraw_money('@£kk') }.to raise_error 'You can\'t input other value than number'
    end

    it 'stores the transaction inside the log' do
      account_transactions = account_2.transactions
      expect(account_transactions.transactions_log).to eq [{ balance: '30.00', credit: '30.00', date: "#{@time}", debit: nil },\
                                                          { balance: '10.00', credit: nil, date: "#{@time}", debit: '20.00' }]
    end
  end
end

# frozen_string_literal: true

require 'statement'
require 'transactions'

describe Statement do
  before do
    @time = Time.now
    allow(Time).to receive(:now).and_return(@time)
  end
  let(:transaction) do
    double(Transactions, transactions_log: [{ balance: 30.00, credit: format('%.2f', 30.00), date: @time, debit: nil }])
  end
  let(:bank_account) { double :bank_account, transactions: transaction }
  let(:statement) { Statement.new }

  describe '#print_statement' do
    it 'return statement transactions with date, type, amount and balance' do
      expect { statement.print_statement(bank_account) }.to output("date || credit || debit || balance\n"\
        "#{@time.strftime('%d/%m/%Y')} || 30.00 ||  || 30.00\n").to_stdout
    end
  end
end

# frozen_string_literal: true

require 'statement'
require 'transaction'

describe Statement do
  before do
    @time = Time.now
    allow(Time).to receive(:now).and_return(@time)
  end
  let(:transaction) do
    double :transaction, date: @time, credit: format('%.2f', 200),
                         debit: nil, balance: 200.00
  end
  let(:bank_account) { double :bank_account, account_transactions: [transaction] }
  let(:statement) { Statement.new }

  describe '#print_statement' do
    it 'return statement transactions with date, type, amount and balance' do
      expect { statement.print_statement(bank_account) }.to output("date || credit || debit || balance\n"\
        "16/01/2019 || 200.00 ||  || 200.00\n").to_stdout
    end
  end
end

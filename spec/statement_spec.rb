# frozen_string_literal: true

require 'statement'
require 'transaction'

describe Statement do
  before do
    @time = Time.now
    Time.stub(:now) { @time }
  end

  let(:transaction) { instance_double('Transaction', date: Time.now, credit: 200, debit: 0, balance: 200) }
  let(:luisa_account) { double :bank_account, name: 'Luisa', balance: 200, account_transactions: [transaction] }
  let(:luisa_statement) { described_class.new }

  describe '#print_statement' do
    it 'return statement transactions with date, type, amount and balance' do
      expect(luisa_statement.print_statement(luisa_account)).to eq [transaction]
    end
  end
end

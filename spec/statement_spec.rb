# frozen_string_literal: true

require 'statement'

describe Statement do
  let(:luisa_account) { double :bank_account, name: 'Luisa', balance: 20, account_transactions: [['14/01/2019', 'credit', 200, 200],['10/01/2019', 'debit', 100, 100]] }
  let(:luisa_statement) { described_class.new }

  describe '#print_statement' do
    it 'print statement showing transactions date, type, amount and balance' do
      expect(luisa_statement.print_statement(luisa_account)).to eq [['10/01/2019', 'credit', 200, 200],
                                                   ['14/01/2019', 'debit', 100, 100]]
    end
  end
end
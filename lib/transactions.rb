class Transactions
  attr_reader :transactions_log
  def initialize
    @transactions_log = []
  end

  def store_credit_transaction(date, credit, debit = nil, balance)
    @transactions_log << { date: date, credit: credit, debit: debit, balance: balance }
    end

  def store_debit_transaction(date, credit = nil, debit, balance)
    @transactions_log << { date: date, credit: credit, debit: debit, balance: balance }
  end
end

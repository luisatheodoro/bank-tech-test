require_relative 'transactions'


class BankAccount
  attr_reader :transactions

  def initialize(transactions = Transactions.new)
    @balance = 0
    @transactions = transactions
  end

  def deposit_money(amount, time_now = Time.now)
    correct_input?(amount)
    @balance += amount
    @transactions.store_credit_transaction(time_now, format('%.2f', amount), format('%.2f', @balance))
  end

  def withdraw_money(amount, time_now = Time.now)
    correct_input?(amount)
    insufficient_funds?(@balance, amount)
    @balance -= amount
    @transactions.store_debit_transaction(time_now, format('%.2f', amount), format('%.2f', @balance))
  end

  private

    def insufficient_funds?(balance, amount)
      raise "You don't have sufficient balance to withdraw." if balance < amount
    end

    def correct_input?(amount)
      raise "You can't input other value than number" if amount.is_a? String
      raise "You can't deposit negative number or 0" if amount <= 0
    end
end

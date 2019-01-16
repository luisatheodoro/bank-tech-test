require_relative 'transaction'

class BankAccount
  attr_reader :account_transactions, :balance

  def initialize
    @balance = 0
    @account_transactions = []
  end

  def deposit_money(amount, time_now = Time.now)
    correct_input?(amount)
    @balance += amount
    @account_transactions << create_transaction(time_now, format('%.2f', amount), nil, format('%.2f', @balance))
  end

  def withdraw_money(amount, time_now = Time.now)
    correct_input?(amount)
    insufficient_funds?(@balance, amount)
    @balance -= amount
    @account_transactions << create_transaction(time_now, nil, format('%.2f', amount), format('%.2f', @balance))
  end

  private

    def create_transaction(date, credit, debit, balance)
      Transaction.new(date, credit, debit, balance)
    end

    def insufficient_funds?(balance, amount)
      raise "You don't have sufficient balance to withdraw." if balance < amount
    end

    def correct_input?(amount)
      raise "You can't input other value than number" if amount.is_a? String
      raise "You can't deposit negative number or 0" if amount <= 0
    end
end

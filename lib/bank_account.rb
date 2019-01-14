require 'date'

class BankAccount

  attr_reader :account_transactions, :balance

  def initialize(client_name)
    @client_name = client_name
    @balance = 0
    @account_transactions = []
  end

  def deposit_money(amount, date = Date.new)
    @balance += amount
    @deposit_time = date.formatted_current_date
    deposit_transaction = [@deposit_time, 'credit', amount, @balance]
    @account_transactions << deposit_transaction
    "You deposited £#{amount} on #{@deposit_time}. Your account balance is £#{@balance}"
  end

  def withdraw_money(amount, date = Date.new)
    insufficient_funds?(@balance, amount)
    @balance -= amount
    @withdrawal_time = date.formatted_current_date
    withdrawal_transaction = [@withdrawal_time, 'debit', amount, @balance]
    @account_transactions << withdrawal_transaction
    "You withdraw £#{amount} on #{@withdrawal_time}. Your account balance is £#{@balance}"
  end

  def insufficient_funds?(balance, amount)
    raise "You don't have sufficient balance to withdraw. Your account balance is £#{balance}" if balance < amount
  end

end

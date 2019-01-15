require 'date'
require_relative 'transaction'

class BankAccount
  MAX_WITHDRAWAL = 100
  attr_reader :account_transactions, :balance

  def initialize(client_name)
    @client_name = client_name
    @balance = 0
    @account_transactions = []
  end

  def deposit_money(amount, time_now = Time.now)
    @balance += amount
    @account_transactions << Transaction.new(time_now, amount, '', @balance)
    "You deposited £#{amount} on #{Date.new.format_date(time_now)}. Your account balance is £#{@balance}"
  end

  def withdraw_money(amount, time_now = Time.now)
    insufficient_funds?(@balance, amount)
    exceed_max_withdrawal?(amount)
    @balance -= amount
    @account_transactions << Transaction.new(time_now, '', amount, @balance)
    "You withdraw £#{amount} on #{Date.new.format_date(time_now)}. Your account balance is £#{@balance}"
  end

  def insufficient_funds?(balance, amount)
    raise "You don't have sufficient balance to withdraw. Your account balance is £#{balance}" if balance < amount
  end

  def exceed_max_withdrawal?(amount)
    raise 'You can only withdraw £100 pounds per transaction' if amount > MAX_WITHDRAWAL
  end

end

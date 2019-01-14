require 'date'

class BankAccount
  MAX_WITHDRAWAL = 100
  attr_reader :account_transactions, :balance

  def initialize(client_name)
    @client_name = client_name
    @balance = 0
    @account_transactions = []
  end

  def deposit_money(deposit_amount, date = Date.new)
    @balance += deposit_amount
    @deposit_time = date.formatted_current_date
    deposit_transaction = [@deposit_time, deposit_amount, '', @balance]
    @account_transactions << deposit_transaction
    "You deposited £#{deposit_amount} on #{@deposit_time}. Your account balance is £#{@balance}"
  end

  def withdraw_money(withdrawal_amount, date = Date.new)
    insufficient_funds?(@balance, withdrawal_amount)
    exceed_max_withdrawal?(withdrawal_amount)
    @balance -= withdrawal_amount
    @withdrawal_time = date.formatted_current_date
    withdrawal_transaction = [@withdrawal_time, '', withdrawal_amount, @balance]
    @account_transactions << withdrawal_transaction
    "You withdraw £#{withdrawal_amount} on #{@withdrawal_time}. Your account balance is £#{@balance}"
  end

  def insufficient_funds?(balance, amount)
    raise "You don't have sufficient balance to withdraw. Your account balance is £#{balance}" if balance < amount
  end

  def exceed_max_withdrawal?(amount)
    raise 'You can only withdraw £100 pounds per transaction' if amount > MAX_WITHDRAWAL
  end

end

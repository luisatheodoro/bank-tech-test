# frozen_string_literal: true

class BankAccount

  attr_reader :account_transactions

  def initialize(client_name)
    @client_name = client_name
    @balance = 0
    @account_transactions = []
  end

  def deposit_money(amount)
    @balance += amount
    @deposit_time = (Time.now + 1800).strftime('%d/%m/%Y')
    deposit_transaction = [@deposit_time, 'credit', amount, @balance]
    @account_transactions << deposit_transaction
    "You deposited £#{amount} on #{@deposit_time}. Your account balance is £#{@balance}"
  end

  def withdraw_money(amount)
    @balance -= amount
    @withdrawal_time = (Time.now + 1800).strftime('%d/%m/%Y')
    withdrawal_transaction = [@withdrawal_time, 'debit', amount, @balance]
    @account_transactions << withdrawal_transaction
    "You withdraw £#{amount} on #{@withdrawal_time}. Your account balance is £#{@balance}"
  end

end

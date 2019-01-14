class BankAccount

  def initialize(client_name)
    @client_name = client_name
    @balance = 0
  end

  def deposit_money(amount)
    @balance += amount
    @deposit_time = (Time.now + 1800).strftime("%d/%m/%Y")
    "You deposited £#{amount} on #{@deposit_time}. Your account balance is £#{@balance}"
  end

  def withdraw_money(amount)
    @balance -= amount
    @withdrawal_time = (Time.now + 1800).strftime("%d/%m/%Y")
    "You withdraw £#{amount} on #{@withdrawal_time}. Your account balance is £#{@balance}"
  end
end
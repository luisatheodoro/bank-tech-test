class BankAccount

  def initialize(client_name)
    @client_name = client_name
    @balance = 0
  end

  def deposit_money(amount)
    @balance += amount
    "You deposited £#{amount} your account balance is £#{@balance}"
  end
end
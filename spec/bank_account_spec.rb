require 'bank_account'

describe BankAccount do
  let(:luisa_account) { described_class.new('Luisa') }

  describe "#deposit_money" do
    it "should send a confirmation of deposit amount, date and account balance" do
    expect(luisa_account.deposit_money(20)).to eq "You deposited £20 on 14/01/2019. Your account balance is £20"
    end
  end

  describe "#withdraw money" do
    it "should send a confirmation of withdrawal amount, date and account balance" do
      luisa_account.deposit_money(20)
      expect(luisa_account.withdraw_money(20)).to eq "You withdraw £20 on 14/01/2019. Your account balance is £0"
    end
    end

  describe "#Print Statement" do
    it "should an account statement showing transactions date, type, amount and balance" do
      luisa_account.deposit_money(200)
      luisa_account.withdraw_money(100)
      expect(luisa_account.print_statement).to eq [["14/01/2019", "credit", 200, 200], ["14/01/2019", "debit", 100, 100]]
    end
  end
end
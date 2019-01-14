require 'bank_account'

describe BankAccount do
  let(:luisa_account) { described_class.new('Luisa') }

  describe "#deposit_money" do
    it "Client is able to see confirmation of deposit amount, date and account balance" do
    expect(luisa_account.deposit_money(20)).to eq "You deposited £20 on 14/01/2019. Your account balance is £20"
    end
  end
end
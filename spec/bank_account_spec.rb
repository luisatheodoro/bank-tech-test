require 'bank_account'

describe BankAccount do
  let(:luisa_account) { described_class.new('Luisa') }

  describe "#deposit_money" do
    it "Client is able to see the money in the account" do
    expect(luisa_account.deposit_money(20)).to eq "You deposited £20 your account balance is £20"
    end
  end
end
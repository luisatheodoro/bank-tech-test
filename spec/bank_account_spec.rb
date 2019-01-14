describe BankAccount do
  let(:luisa_account) { described_class.new('Luisa') }

  describe "#deposit_money" do
    it "Client is able to see the money in the account"
    expect(luisa_account.deposit_money(20.00)).to eq "£20.00 was deposited"
  end


end
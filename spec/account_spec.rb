describe Censys::API do
  before(:context) do
    @api = Censys::API.new
  end

  describe "#account", :vcr do
    it "should return an Account instance" do
      account = @api.account
      expect(account).to be_a(Censys::Account)
      expect(account.quota).to be_a(Censys::Account::Quota)
    end
  end
end

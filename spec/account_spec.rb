# frozen_string_literal: true

describe Censys::API do
  before(:context) do
    @api = Censys::API.new
  end

  describe "#account", :vcr do
    it "should return an Account" do
      account = @api.account
      expect(account).to be_a(Censys::Account)
      expect(account.quota).to be_a(Censys::Account::Quota)
    end
  end
end

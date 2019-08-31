# frozen_string_literal: true

describe Censys::API do
  before(:context) do
    @api = described_class.new
  end

  describe "#account", :vcr do
    it "returns an Account" do
      account = @api.account
      expect(account).to be_a(Censys::Account)
      expect(account.quota).to be_a(Censys::Account::Quota)
    end
  end
end

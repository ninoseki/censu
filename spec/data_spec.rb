require 'spec_helper'

describe Censys::API do
  before(:context) do
    @api = Censys::API.new
  end

  describe "#data", :vcr do
    context "series_list" do
      it "should return SeriesList response" do
        data = @api.data
        expect(data).to be_a(Censys::Data::SeriesList)
        expect(data.primary_series).to be_a(Hash)
        expect(data.raw_series).to be_a(Hash)
      end
    end
  end
end
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

    context "series" do
      it "should return Series response" do
        series = @api.data(series: "22-ssh-banner-full_ipv4")
        expect(series).to be_a(Censys::Data::Series)
        expect(series.id).to eq("22-ssh-banner-full_ipv4")
        expect(series.port).to be_a(Integer)
        expect(series.protocol).to be_a(String)
        expect(series.subprotocol).to be_a(String)
        expect(series.destination).to be_a(String)
        expect(series.name).to be_a(String)
        expect(series.description).to be_a(String)
        expect(series.results).to be_a(Hash)
      end
    end

    context "result" do
      it "should return Result response" do
        result = @api.data(series: "22-ssh-banner-full_ipv4", result: "20150930T0056")
        expect(result).to be_a(Censys::Data::Result)
        expect(result.id).to eq("20150930T0056")
        expect(result.files).to be_a(Hash)
        expect(result.timestamp).to be_a(Time)
      end
    end
  end
end

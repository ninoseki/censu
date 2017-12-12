require 'spec_helper'

describe CenSys::API do
  before(:context) do
    @api = CenSys::API.new
  end

  describe "#search" do
    context "ipv4" do
      it "should return IPv4 response" do
        res = @api.ipv4.search(query: "dropbox.com")
        expect(res).to be_a(Search::Response)

        first = res.results.first
        expect(first).to be_a(Search::IPv4)
        expect(first.ip).to be_a(String)
        expect(first.protocols).to be_a(Array)
      end
    end

    context "websites" do
      it "should return Website response" do
        res = @api.websites.search(query: "dropbox.com")
        expect(res).to be_a(Search::Response)

        first = res.results.first
        expect(first).to be_a(Search::Website)
        expect(first.domain).to be_a(String)
        expect(first.alexa_rank).to be_a(Integer)
      end
    end
  end
end

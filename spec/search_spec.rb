require 'spec_helper'

describe Censys::API do
  before(:context) do
    @api = Censys::API.new
  end

  describe "#search", :vcr do
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

    context "certificates" do
      it "should return Certificate response" do
        res = @api.certificates.search(query: "dropbox.com")
        expect(res).to be_a(Search::Response)

        first = res.results.first
        expect(first).to be_a(Search::Certificate)
        expect(first.fingerprint_sha256).to be_a(String)
        expect(first.subject_dn).to be_a(String)
        expect(first.issuer_dn).to be_a(String)
      end
    end
  end
end

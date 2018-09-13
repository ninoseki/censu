# frozen_string_literal: true

describe Censys::API do
  before(:context) do
    @api = Censys::API.new
  end

  describe "#search", :vcr do
    context "ipv4" do
      it "should return IPv4 response" do
        res = @api.ipv4.search(query: "dropbox.com")
        expect(res).to be_a(Search::Response)

        expect(res.metadata).to be_a(Search::Metadata)
        expect(res.metadata.count).to be_a(Integer)
        expect(res.metadata.query).to eq("dropbox.com")

        expect(res.each).to be_a(Enumerator)
        expect(res.pages).to be_a(Enumerator)

        first = res.results.first
        expect(first).to be_a(Search::IPv4)
        expect(first.ip).to be_a(String)
        expect(first.protocols).to be_a(Array)

        expect(first.location).to be_a(Location)
        expect(first.location.country).to be_a(String)
      end
    end

    context "websites" do
      it "should return Website response" do
        res = @api.websites.search(query: "dropbox.com")
        expect(res).to be_a(Search::Response)

        expect(res.metadata).to be_a(Search::Metadata)
        expect(res.metadata.count).to be_a(Integer)
        expect(res.metadata.query).to eq("dropbox.com")

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

        expect(res.metadata).to be_a(Search::Metadata)
        expect(res.metadata.count).to be_a(Integer)
        expect(res.metadata.query).to eq("dropbox.com")

        first = res.results.first
        expect(first).to be_a(Search::Certificate)
        expect(first.fingerprint_sha256).to be_a(String)
        expect(first.subject_dn).to be_a(String)
        expect(first.issuer_dn).to be_a(String)
      end
    end
  end
end

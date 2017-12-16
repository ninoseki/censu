require 'spec_helper'

describe Censys::API do
  before(:context) do
    @api = Censys::API.new
  end

  describe "#view", :vcr do
    context "ipv4" do
      it "should return IPv4 response" do
        view = @api.view(:ipv4, "8.8.8.8")
        expect(view).to be_a(Censys::IPv4)
        expect(view.tags).to be_a(Array)
        expect(view.updated_at).to be_a(Time)
        expect(view.autonomous_system).to be_a(AutonomousSystem)
        expect(view.location).to be_a(Location)
        expect(view.ports).to be_a(Hash)
        expect(view.protocols).to be_a(Array)
        expect(view.dig("location", "city")).to eq("Mountain View")

        expect(view.ip).to eq("8.8.8.8")
        expect(view.to_s).to eq("8.8.8.8")
        expect(view.protocols).to be_a(Array)
      end
    end

    context "websites" do
      it "should return Website response" do
        view = @api.view(:websites, "google.com")
        expect(view).to be_a(Censys::Website)
        expect(view.domain).to eq("google.com")
        expect(view.to_s).to eq("google.com")
        expect(view.alexa_rank).to be_a(Integer)
      end
    end

    context "certificates" do
      it "should return Certificate response" do
        sha256 = "821a712a29d8e25915f66a9771519746c5aa73a45321fd4ca7ef644e1cadda59"
        view = @api.view(:certificates, sha256)
        expect(view).to be_a(Censys::Certificate)
        expect(view.raw).to be_a(String)
        expect(view.parsed).to be_a(Hash)
        expect(view.valid_nss).to eq(true)
      end
    end
  end
end
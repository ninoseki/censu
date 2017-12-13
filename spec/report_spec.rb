require 'spec_helper'

describe CenSys::API do
  before(:context) do
    @api = CenSys::API.new
  end

  describe "#report" do
    context "ipv4" do
      it "should return ipv4 response" do
        params = {
          query: "8.8.8.8",
          field: "ports",
          buckets: 10
        }
        report = @api.report(:ipv4, params)
        expect(report).to be_a(Report::Response)
        expect(report.status).to eq("ok")
        expect(report.ok?).to be_truthy
        expect(report.results).to be_a(Hash)
        expect(report.metadata).to be_a(Report::Metadata)
        expect(report.metadata.count).to be_a(Integer)
        expect(report.metadata.backend_time).to be_a(Integer)
        expect(report.metadata.non_null_count).to be_a(Integer)
        expect(report.metadata.other_result_count).to be_a(Integer)
        expect(report.metadata.buckets).to be_a(Integer)
        expect(report.metadata.error_bound).to be_a(Integer)
        expect(report.metadata.query).to eq("8.8.8.8")
      end
    end

    context "websites" do
      it "should return website response" do
        params = {
          query: "google.com",
          field: "ports",
          buckets: 10
        }
        report = @api.report(:websites, params)
        expect(report).to be_a(Report::Response)
        expect(report.metadata).to be_a(Report::Metadata)
        expect(report.metadata.query).to eq("google.com")
      end
    end

    context "certificates" do
      it "should return certificate response" do
        params = {
          query: "google.com",
          field: "precert",
          buckets: 10
        }
        report = @api.report(:certificates, params)
        expect(report).to be_a(Report::Response)
        expect(report.metadata).to be_a(Report::Metadata)
        expect(report.metadata.query).to eq("google.com")
      end
    end
  end
end

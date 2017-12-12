require 'spec_helper'

describe CenSys::API do
  before(:context) do
    @api = CenSys::API.new
  end

  describe "#report" do
    context "ipv4" do
      it "should return ipv4 response" do
        report = @api.report(:ipv4, query: "8.8.8.8", field: "location.country_code", bukets: 10)
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
  end
end

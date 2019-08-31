# frozen_string_literal: true

describe Censys do
  it "has a VERSION constant" do
    expect(subject.const_get('VERSION')).not_to be_empty
  end
end

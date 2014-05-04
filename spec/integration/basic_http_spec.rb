require_relative 'spec_helper'

describe "basic_http" do
  it_behaves_like "any website", "http://example.org"
end

require_relative 'spec_helper'

shared_examples_for "any website" do |uri|
  it_should_behave_like :MechanizeTest do
    it "when I visit #{uri} it should return with a 200" do
      page = agent.get(uri)
      expect(page.code).to eq('200')
    end
  end
end

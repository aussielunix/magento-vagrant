require 'mechanize'
require 'rspec/core'
require 'rspec'

require_relative 'generic_web_shared'

share_examples_for :MechanizeTest do
  attr_reader :agent

  before :all do
    @verification_errors = []

    @agent = Mechanize.new
    @agent.user_agent_alias = 'Mac Safari'
  end

  before :each do
  end

  after :each do
    @verification_errors.should == []
  end

end

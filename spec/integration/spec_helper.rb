# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'mechanize'
require 'rspec/core'
require 'rspec'
require 'yaml'

require_relative 'generic_web_shared'

module Helpers
  def self.url
    "http://#{YAML.load(File.read('puppet/hiera/common.yaml'))['url'].strip}/"
  end
end

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

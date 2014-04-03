#!/usr/bin/env ruby

require 'spec_helper'

Capybara.app_host = 'http://192.168.33.10'

describe "get /" do
  it "a webserver should return with a 200" do
    visit("/")
    page.status_code.should == 200
  end
end

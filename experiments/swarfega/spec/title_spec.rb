#!/usr/bin/env ruby

require_relative 'spec_helper'

describe "a basic webserver page should exist" do
  it "should have Mick Pollard somewhere in the page" do
    visit '/'
    expect(page).to have_content 'Mick Pollard'
  end
end

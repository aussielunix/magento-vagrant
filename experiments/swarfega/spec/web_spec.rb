
require_relative 'spec_helper'

feature 'Main Page' do
  it 'shows the main page content' do
    visit '/'
#    page.current_path.should == '/'
    page.should have_content('Mick Pollard')
  end
end

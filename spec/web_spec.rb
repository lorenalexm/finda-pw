require 'rspec'
require_relative 'spec_helper'

describe 'Web facing application', :type => :feature do
  it 'should display copyright on homepage' do
    visit '/'
    expect(page).to have_content 'Copyright 2016'
  end
end

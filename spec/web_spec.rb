require 'rspec'
require 'json'
require_relative 'spec_helper'

describe 'Web facing', :type => :feature do
  context 'application' do
    it 'should display copyright on homepage' do
      visit '/'
      expect(page).to have_content 'Copyright 2016'
    end
  end
end

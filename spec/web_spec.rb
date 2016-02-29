require 'rspec'
require 'json'
require_relative 'spec_helper'

describe 'Web facing', :type => :feature do
  context 'application' do
    it 'should display copyright on homepage' do
      visit '/'
      expect(page).to have_content 'Copyright 2016'
    end

    it 'should request and display a generated password' do
      visit '/'
      click_button 'Generate Password'
      within_table 'passwords' do
        expect(page).to have_content 'password'
      end
    end
  end

  context 'api' do
    it 'should return the version' do
      visit '/api/version'
      expect(page).to have_content 'version'
    end
  end
end

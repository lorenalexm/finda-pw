require 'rspec'
require 'json'
require_relative 'spec_helper'

describe 'Web facing', :type => :feature do
  context 'application' do
    it 'should display footer on homepage' do
      visit '/'
      expect(page).to have_content 'Alex Loren'
    end

    it 'should request and display a generated password' do
      visit '/'
      click_button 'Generate'
      expect(page).to have_selector('table tbody tr', :count => 1)
    end

    it 'should not have more options by default' do
      visit '/'
      expect(page).not_to have_content 'LESS OPTIONS'
    end

    it 'should display more options' do
      visit '/'
      click_button 'More Options'
      expect(page).to have_content 'LESS OPTIONS'
    end

    it 'should generate 5 passwords' do
      visit '/'
      click_button 'More Options'
      select '5', :from => 'count'
      click_button 'Generate'
      expect(page).to have_selector('table tbody tr', :count => 5)
    end
  end

  context 'api' do
    it 'should return the version' do
      visit '/api/version'
      expect(page).to have_content 'version'
    end
  end
end

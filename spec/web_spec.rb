require 'rspec'
require 'json'
require_relative 'spec_helper'

describe 'Web facing' do
  describe 'application', :type => :feature do
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

  describe 'api', :type => :request do
    it 'should return the version' do
      get '/api/version'
      expect(last_response.body).to include 'version'
    end

    it 'sould return a single password as json' do
      get '/api/generate'
      expect(last_response.body).to include 'password'
    end

    it 'should return 5 passwords as json' do
      post '/api/generate', { :count => 5 }.to_json
      expect(JSON.parse(last_response.body).length).to eq 5
    end
  end
end

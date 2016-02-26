require 'rspec'
require_relative 'spec_helper'

describe 'Web facing application' do
  it 'should display copyright on homepage' do
    get '/'
    expect(last_response.body).to include 'Copyright 2016'
  end
end

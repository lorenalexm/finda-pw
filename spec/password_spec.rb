require 'rspec'
require_relative 'spec_helper'
require_relative '../helpers/password'

describe 'Password generator', :type => :feature do
  context 'with no options' do
    it 'creates simple password 8 characters in length' do
      out = Password.generate
      expect(out.to_s.length).to eq 8
    end
  end
end
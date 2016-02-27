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

  context 'with options' do
    it 'creates simple password 4 characters in length' do
      out = Password.generate :length => 4
      expect(out.to_s.length).to eq 4
    end

    it 'creates password without digits' do
      out = Password.generate :digits => false
      expect(out[/\d/].nil?).to be true
    end

    it 'creates password containing uppercase letters' do
      out = Password.generate :uppercase => true
      expect(out[/[A-Z]/].nil?).to be_falsey
    end

    it 'creates password with uppercase letters and no digits' do
      out = Password.generate :uppercase => true, :digits => false
      puts out
      expect(out[/[A-Z]/].nil?).to be_falsey
      expect(out[/\d/].nil?).to be true
    end
  end
end
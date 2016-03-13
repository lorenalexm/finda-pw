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

    it 'creates password containing uppercase' do
      out = Password.generate :uppercase => true
      expect(out[/[A-Z]/].nil?).to be_falsey
    end

    it 'creates password with uppercase and no digits' do
      out = Password.generate :uppercase => true, :digits => false
      expect(out[/[A-Z]/].nil?).to be_falsey
      expect(out[/\d/].nil?).to be true
    end

    it 'creates password without lowercase' do
      out = Password.generate :lowercase => false
      expect(out[/[a-z]/].nil?).to be true
    end

    it 'creates password with uppercase and no lowercase' do
      out = Password.generate :uppercase => true, :lowercase => false
      expect(out[/[A-Z]/].nil?).to be_falsey
      expect(out[/[a-z]/].nil?).to be true
    end

    it 'creates password with uppercase and no lowercase or digits' do
      out = Password.generate :uppercase => true, :lowercase => false, :digits => false
      expect(out[/[A-Z]/].nil?).to be_falsey
      expect(out[/[a-z]/].nil?).to be true
      expect(out[/\d/].nil?).to be true
    end

    it 'contains no like letters or digits' do
      out = Password.generate :uppercase => true, :lowercase => true, :digits => true, :symbols => true, :alike => false
      expect(out).not_to include('B', '8', 'G', '6', 'I', '1', 'l', '0', 'O', 'Q', 'D', 'S', '5', 'Z', '2','v', 'V', 'w', 'W', 'u', 'U')
    end

    it 'creates password containing symbols' do
      out = Password.generate :symbols => true
      expect(out[/\W/].nil?).to be_falsey
    end

    it 'returns nil if unable to generate' do
      out = Password.generate :uppercase => false, :lowercase => false, :digits => false
      expect(out.nil?).to be true
    end

    it 'generates an array of 10 passwords' do
      out = Password.generate :count => 10
      expect(out.length).to eq 10
    end
  end
end

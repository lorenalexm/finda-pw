require 'json'
require 'strong_password'
require_relative '../helpers/password'

module Api
  def self.registered(app)
    app.get '/api/version' do
      {:version => '0.1.0'}.to_json
    end

    app.get '/api/generate' do
      password = Password.generate
      entropy = StrongPassword::StrengthChecker.new(password)
      out = Hash.new
      out[:password] = password
      out[:entropy] = entropy.calculate_entropy
      out[:weak] = entropy.is_weak?
      out.to_json
    end
  end
end
require 'json'
require 'strong_password'
require_relative '../helpers/password'

module Api
  def self.registered(app)
    app.get '/api/status' do
      return 'UP'
    end

    app.get '/api/version' do
      {:version => '0.1.0'}.to_json
    end

    app.get '/api/generate' do
      password = Password.generate(:lowercase => true, :digits => true)
      entropy = StrongPassword::StrengthChecker.new(password)
      out = Hash.new
      out[:password] = password
      out[:entropy] = entropy.calculate_entropy
      out[:weak] = entropy.is_weak?
      out.to_json
    end

    app.post '/api/generate' do
      options = JSON.parse(request.body.read, :symbolize_names => true)
      passwords = Password.generate options

      if passwords.kind_of?(Array)
        out = Array.new
        passwords.each do |p|
          entropy = StrongPassword::StrengthChecker.new(p)
          item = Hash.new
          item[:password] = p
          item[:entropy] = entropy.calculate_entropy
          item[:weak] = entropy.is_weak?
          out.push item
        end
        out.to_json
      else
        entropy = StrongPassword::StrengthChecker.new(passwords)
        out = Hash.new
        out[:password] = passwords
        out[:entropy] = entropy.calculate_entropy
        out[:weak] = entropy.is_weak?
        out.to_json
      end
    end
  end
end

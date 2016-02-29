require 'json'
require_relative '../helpers/password'

module Api
  def self.registered(app)
    app.get '/api/version' do
      {:version => '0.1.0'}.to_json
    end

    app.get '/api/generate' do
      {:password => Password.generate}.to_json
    end
  end
end
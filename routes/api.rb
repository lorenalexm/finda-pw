require 'json'

module Api
  def self.registered(app)
    app.get '/api/version' do
      {:version => '0.1.0'}.to_json
    end
  end
end
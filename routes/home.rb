require 'slim'

module Home
  def self.registered(app)
    app.get '/' do
      slim :home
    end
  end
end
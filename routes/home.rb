module Home
  def self.registered(app)
    app.get '/' do
      return 'Copyright 2016'
    end
  end
end
require 'sinatra/base'
require 'slim'
require_relative 'routes/init'

class FindaPw < Sinatra::Base
  configure :production do
    Slim::Engine.set_options pretty: false
    set :clean_trace, true
    set :show_exceptions, false
  end

  configure :development do
    Slim::Engine.set_options pretty: true
    set :show_exceptions, true
  end

  register Home
end

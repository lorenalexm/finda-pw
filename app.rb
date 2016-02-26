require 'sinatra/base'
require_relative 'routes/init'

class FindaPw < Sinatra::Base
  configure :production do
    set :clean_trace, true
    set :show_exceptions, false
  end

  configure :development do
    set :show_exceptions, true
  end

  register Home
end

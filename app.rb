require 'sinatra/base'

class FindaPw < Sinatra::Base
  configure :production do
    set :clean_trace, true
    set :show_exceptions, false
  end

  configure :development do
    set :show_exceptions, true
  end
end

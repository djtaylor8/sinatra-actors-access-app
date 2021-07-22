require './config/environment'
require 'rack-flash'
require 'sysrandom'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "dev_secret"
    use Rack::Flash 
  end

  get "/" do
    erb :welcome
  end

end

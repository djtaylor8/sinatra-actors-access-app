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

  get '/signup' do
    if logged_in?
        @user = current_user 
        redirect "/actor/#{@user.slug}"
    else  
        erb :'actors/create_actor'
    end 
  end 

  post '/signup' do
      @user = Actor.create(:name => params["name"], :email => params[:email], :password => params[:password], :bio => params[:bio]) 
      @user.agent = Agent.find_or_create_by(name: params[:agent][:name].strip)
      @user.headshots << Headshot.find_by(name: params[:headshot][:name].strip) unless params[:headshot][:name] == ''
      @user.save
      if @user.id != nil    
        session[:user_id] = @user.id  
        flash[:message] = "Successfully updated profile!"
        redirect "/actor/#{@user.slug}"
      else
        flash[:message] = "Looks like you already have an account. Please sign in!"
        redirect '/login'
      end
  end

  get '/login' do 
    if logged_in?
      @user = current_user 
      redirect "/actor/#{@user.slug}"
    else   
      erb :'actors/login'
    end 
  end

  post '/login' do
    @user = Actor.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password]) 
        session[:user_id] = @user.id 
        redirect "/actor/#{@user.slug}"
    else 
        flash[:message] = "Sorry, the username or password do not match. Please try agin."
        redirect '/login'
    end
  end

  post '/logout' do
    if logged_in?
        session.clear
        redirect '/login'
    else
        redirect '/'
    end
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      Actor.find(session[:user_id])
    end
  end

end

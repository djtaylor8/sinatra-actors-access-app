require 'pry'
class ActorsController < ApplicationController
    
    
    get '/actor/signup' do
        if logged_in?
            @user = current_user 
            redirect "/actor/#{@user.slug}"
        else  
            erb :'actors/create_actor'
        end 
    end

    post '/actor/signup' do 
        if params[:name] == '' || params[:email] == '' || params[:password] == '' || params[:bio] == ''
            flash[:message] = "Error - Please complete all fields!"
            redirect '/actor/signup'
        else
            @user = Actor.create(:name => params["name"], :email => params[:email], :password => params[:password], :bio => params[:bio])
            @user.agent = Agent.find_or_create_by(name: params[:agent][:name])
            @user.save  
            session[:user_id] = @user.id  
            flash[:message] = "Successfully created new account!"
            redirect "/actor/#{@user.slug}"
        end 
    end

    get '/actor/login' do 
        if logged_in?
            @user = current_user 
            redirect "/actor/#{@user.slug}"
        else   
        erb :'actors/login'
        end 
    end

    post '/actor/login' do
        @user = Actor.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password]) 
            session[:user_id] = @user.id 
            redirect "/actor/#{@user.slug}"
        else 
            flash[:message] = "Sorry, the username or password do not match. Please try agin."
            redirect '/actor/login'
        end
    end

    get '/actor/:slug' do
        if !logged_in? 
            redirect '/actor/login' 
        else 
            @user = current_user    
            erb :'/actors/show'
        end
    end

    get '/actor/:slug/edit' do 
        @user = Actor.find_by_slug(params[:slug]) 
        @auditions = @user.auditions 
        erb :'actors/edit_actor'
    end

    patch '/actor/:slug' do 
        @user = current_user  
        @user.update(params[:actor])
        @user.agent = Agent.find_by(id: params[:agent])
        @user.audition_ids = params[:auditions]
        @user.save 
        flash[:message] = "Successfully updated profile!"
        redirect "/actor/#{@user.slug}"
    end

    post '/actor/logout' do
        if logged_in?
            session.clear
            redirect '/actor/login'
        else
            redirect '/'
        end
    end

    delete '/actor/:slug/delete' do 
            @user = current_user
            session.clear
            @user.destroy 
            flash[:message] = "Profile has been deleted!" 
            redirect '/'
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
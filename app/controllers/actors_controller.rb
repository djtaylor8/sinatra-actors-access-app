class ActorsController < ApplicationController
    
    
    get '/actor-signup' do
        if logged_in?
            @actor = current_user 
            redirect '/actors/#{@actor.slug}'
        else
            @agents = Agent.all   
            erb :'actors/create_actor'
        end 
    end

    post '/actor-signup' do 

    end

    get '/actor-login' do
        if logged_in?
            erb :'actors/show'
        else  
        erb :'actors/login'
        end 
    end

    post '/actor-login' do
        @actor = Actor.find_by(:email => params[:email])
        if @user && user.authenticate(params[:password])
            session[:user_id] = @user.id 
            redirect "/actors/#{@actor.slug}"
        else 
            flash[:message] = "Sorry, the username or password do not match. Please try agin."
            redirect '/actor-login'
        end
    end


end
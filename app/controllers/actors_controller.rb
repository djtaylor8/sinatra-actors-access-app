class ActorsController < ApplicationController 

    get '/actor-login' do
        if logged_in?
            erb :'actors/show'
        else  
        erb :'actors/login'
        end 
    end

    post '/actor-login' do 

    end

    get '/actor-signup' do 
        erb :'actors/create_user'
    end

    post '/actor-signup' do 

    end





end
class AuditionsController < ApplicationController 

    get '/auditions' do
        @user = current_user 
        @auditions = Audition.all
        erb :'auditions/index' 
    end

    get '/auditions/new' do 
        erb :'auditions/create_audition'
    end

    get '/auditions/:slug' do
        @audition = Audition.find_by_slug(params[:slug]) 
        erb :'auditions/show'
    end

    patch '/auditions/:slug' do 
        @user = current_user  
        @user.audition_ids = params[:auditions]
        @user.save 
        flash[:message] = "Successfully updated auditions!"
        redirect "/actor/#{@user.slug}"
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
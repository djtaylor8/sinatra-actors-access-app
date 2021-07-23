class AuditionsController < ApplicationController 

    get '/auditions' do
        @user = current_user 
        @auditions = Audition.all
        erb :'auditions/index' 
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
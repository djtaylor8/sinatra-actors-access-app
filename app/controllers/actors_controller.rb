class ActorsController < ApplicationController

    get '/actor/:slug' do
        if !logged_in? 
            redirect '/actor/login' 
        else 
            @user = current_user    
            erb :'/actors/show'
        end
    end

    get '/actor/:slug/edit' do 
        @user = current_user  
        @auditions = @user.auditions 
        erb :'actors/edit_actor'
    end

    patch '/actor/:slug' do 
        @user = current_user  
        @user.update(params[:actor])
        @user.agent = Agent.find_or_create_by(name: params[:agent][:name])
        @user.audition_ids = params[:auditions]
        @user.save 
        flash[:message] = "Successfully updated profile!"
        redirect "/actor/#{@user.slug}"
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
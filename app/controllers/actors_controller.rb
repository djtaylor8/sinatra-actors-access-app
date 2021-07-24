class ActorsController < ApplicationController

    get '/actor/:slug' do
        if !logged_in? 
          redirect '/login' 
        else  
          @user = Actor.find_by_slug(params[:slug]) 
          erb :'/actors/show'
        end
    end

    get '/actor/:slug/edit' do 
        if !logged_in?
          redirect '/login'
        end
        @user = current_user
        if params[:slug] != @user.slug
          flash[:message] = "Sorry, you can only edit your own profile!"
          redirect "/actor/#{@user.slug}"
        else
          @headshots = @user.headshots 
          @auditions = Audition.all 
          erb :'actors/edit_actor'
        end
    end

    patch '/actor/:slug' do 
        @user = current_user  
        @user.update(params[:actor])
        @user.agent = Agent.find_or_create_by(name: params[:agent][:name])
        @user.headshots << Headshot.find_by(name: params[:headshot][:name]) unless params[:headshot][:name] == ''
        @user.headshots.delete_by(id: params[:user_headshots]) 
        @user.audition_ids = params[:auditions]
        @user.save 
        flash[:message] = "Successfully updated profile!"
        redirect "/actor/#{@user.slug}"
    end

    delete '/actor/:slug/delete' do
        if !logged_in?
            redirect '/login'
        end
        @user = current_user
        if params[:slug] != @user.slug
          flash[:message] = "Sorry, you can only delete your own profile!"
          redirect "/actor/#{@user.slug}"
        else
          session.clear
          @user.destroy 
          flash[:message] = "Profile has been deleted!" 
          redirect '/'
        end
    end

end
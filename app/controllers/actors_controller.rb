class ActorsController < ApplicationController

    get '/actor/:slug' do
        if !logged_in? 
            redirect '/login' 
        end 
            @user = current_user 
            if params[:slug] != @user.slug
              flash[:message] = "Sorry, you can only view your own profile!"
              redirect "/actor/#{@user.slug}"
            else     
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
          @auditions = @user.auditions 
          erb :'actors/edit_actor'
        end
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
        if !logged_in?
            redirect '/login'
        end
        @user = current_user
        binding.pry 
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
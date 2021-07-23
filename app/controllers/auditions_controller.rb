class AuditionsController < ApplicationController 

    get '/auditions' do
        if !logged_in? 
          redirect '/login'
        else 
          @user = current_user 
          @auditions = Audition.all
          erb :'auditions/index' 
        end
    end

    get '/auditions/:slug' do
        if !logged_in? 
          redirect '/login'
        else
          @audition = Audition.find_by_slug(params[:slug]) 
          erb :'auditions/show'
        end
    end

    patch '/auditions/:slug' do 
        @user = current_user  
        @user.audition_ids = params[:auditions]
        @user.save 
        flash[:message] = "Successfully updated auditions!"
        redirect "/actor/#{@user.slug}"
    end

end
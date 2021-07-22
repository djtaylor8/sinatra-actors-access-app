class AgentsController < ApplicationController 

    




    helpers do
        def logged_in?
          !!session[:user_id]
        end
    
        def current_user
          Agent.find(session[:user_id])
        end
      end

end
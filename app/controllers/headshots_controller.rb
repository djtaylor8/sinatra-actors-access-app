class HeadshotsController < ApplicationController

    get '/headshots' do 
        @headshots = Headshot.all 
        erb :'/headshots/index' 
    end

end
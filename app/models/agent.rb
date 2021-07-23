class Agent < ActiveRecord::Base
    has_many :actors
    has_many :auditions  
end
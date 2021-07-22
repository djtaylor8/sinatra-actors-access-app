class Agent < ActiveRecord::Base
    has_many :actors
    has_many :auditions  
    has_secure_password
 
    def slug
        name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end

    def self.find_by_slug(slug)
        Agent.all.find {|agent| agent.slug == slug}
    end

end
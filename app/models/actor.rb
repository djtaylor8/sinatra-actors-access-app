class Actor < ActiveRecord::Base 
    belongs_to :agent
    has_many :actor_auditions 
    has_many :auditions, through: :actor_auditions
    has_secure_password

    def slug
        name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end

    def self.find_by_slug(slug)
        Actor.all.find {|actor| actor.slug == slug}
    end
    
end
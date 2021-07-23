class Audition < ActiveRecord::Base
   belongs_to :agent 
   has_many :actor_auditions 
   has_many :actors, through: :actor_auditions 


    def slug
        role.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end

    def self.find_by_slug(slug)
        Audition.all.find {|audition| audition.slug == slug}
    end
end
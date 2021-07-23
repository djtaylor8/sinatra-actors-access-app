actors_list = {
    "Katherine Bourne Taylor" => {
      :email => "kbt@me.com",
      :password_digest => "password",
      :bio => "Hi! I'm an actor!"
    },
    "Kathryn Acosta" => {
      :email => "kathryn@me.com",
      :password_digest => "password1",
      :bio => "Hi! I'm an actor too!"
    },
    "Sam Hubbard" => {
      :email => "sammy@me.com",
      :password_digest => "password2",
      :bio => "Hi! I'm an actor, and I love sully!"
    },
    "Emma Stone" => {
      :email => "emma@me.com",
      :password_digest => "password3",
      :bio => "Hi! I'm an actor and I'm famous!"
    },
    "Clare Cooney" => {
      :email => "clare@me.com",
      :password_digest => "password4",
      :bio => "Hi! I'm an actor and editor!"
    },
    "Chris Rickett" => {
      :email => "chris@me.com",
      :password_digest => "password5",
      :bio => "Hi! I'm an actor and avid hiker!"
    },
    "Noelle Dragon" => {
      :email => "noelle@me.com",
      :password_digest => "password6",
      :bio => "Hi! I'm a voice over actor!"
    },
    "Katherine Duffy" => {
      :email => "katherine@me.com",
      :password_digest => "password7",
      :bio => "Hi! I'm an actor and I do funny stuff!"
    },
    "Tobias Funke" => {
      :email => "tobias@me.com",
      :password_digest => "password8",
      :bio => "Hi! I'm an actor. No really, I AM an actor!"
    }
  }

actors_list.each do |name, actor_hash|
  p = Actor.new
  p.name = name
  actor_hash.each do |attribute, value|
      p[attribute] = value
  end
  p.save
end

agent_list = {
    "Hollywood Ed" => {
        :email => "ed@me.com",
        :password_digest => "password14"
    },
    "KMR" => {
        :email => "kmr@me.com",
        :password_digest => "password10"
    },
    "Big Time Agent" => {
        :email => "big@me.com",
        :password_digest => "password11"
    },
    "Carl Weathers" => {
        :email => "carl@me.com",
        :password_digest => "password12" 
    }
  }

agent_list.each do |name, agent_hash|
  p = Agent.new
  p.name = name
  agent_hash.each do |attribute, value|
    p[attribute] = value 
  end
  p.save
end


audition_list = {
    "Frightened Inmate No. 2" => {
        :location => "Los Angeles",
        :description => "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nam doloremque repellendus incidunt adipisci ut culpa eum error, perferendis nemo placeat sunt aperiam ad laudantium iusto neque rem quos non aliquam?"
    },
    "The Red Head" => {
        :location => "Vancouver",
        :description => "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nam doloremque repellendus incidunt adipisci ut culpa eum error, perferendis nemo placeat sunt aperiam ad laudantium iusto neque rem quos non aliquam?"
    },
    "Con Man" => {
        :location => "Atlanta",
        :description => "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nam doloremque repellendus incidunt adipisci ut culpa eum error, perferendis nemo placeat sunt aperiam ad laudantium iusto neque rem quos non aliquam?"
    }
  }

audition_list.each do |role, audition_hash|
  p = Audition.new
  p.role = role 
  audition_hash.each do |attribute, value|
    p[attribute] = value 
  end
  p.save
end

headshot_list = {
  "kbt_1" => {
      :path => "images/91A13EBF-C78B-4ABD-B626-1C9B7BCDAE21.PNG"
  },
  "djt_1" => {
      :path => "images/31674824_363596040799636_4816782079884787712_n.png"
  },
  "han" => {
      :path => "images/han.png"
  },
  "kbt_2" => {
      :path => "images/IMG_7168.png"
  },
  "kbt_3" => {
      :path => "images/IMG_7188.png"
  },
  "kbt_4" => {
      :path => "images/IMG_9945.PNG"
  },
  "lbj" => {
      :path => "images/lbj.png"
  },
  "tobias_blue" => {
      :path => "images/tobias_blue.png"
  },
  "tobias_doc" => {
      :path => "images/tobias_doc.PNG"
  }
}

headshot_list.each do |name, headshot_hash|
p = Headshot.new
p.name = name 
headshot_hash.each do |attribute, value|
  p[attribute] = value 
end
p.save
end

class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  
  @@all = []
  def initialize(name:, type:, db:, id:)
    @name = name
    @type = type
    @db = db
    @@id = id
    @@all << self
  end
  
  def self.save(name, type, db)
    #@id += 1
    @vals = db.execute("INSERT INTO pokemon (id, name, type) VALUES (?, ?, ?)", [@@id,name,type])
    #binding.pry
    @vals.each{|item|
      self.new(id: @@id, name: name, type: type)
      #binding.pry
    }
  end
  
  def self.find(id, db, hp=nil)
    if hp == nil
      @hp = 60
    else
      @hp = hp
    end
    db.execute("SELECT pokemon.id, pokemon.name, pokemon.type, pokemon.hp FROM pokemon WHERE pokemon.id = ?", id.to_i)
    #binding.pry
    #@id = id
    @@all.detect{|i|
      i.id = id
    }
  end
   
  def self.all
    @@all
  end
  
  def alter_hp
  end
end

class Pokemon
  attr_accessor :id, :name, :type, :db
  
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
    @vals.each{|item|
      self.new(id: @@id, name: name, type: type)
      #binding.pry
    }
  end
  
  def self.find(id, db)
    db.execute("SELECT pokemon.id, pokemon.name, pokemon.type FROM pokemon WHERE pokemon.id = ?", id.to_i)
    #binding.pry
    #@id = id
    @@all.detect{|i|
      i.id = id
    }
  end
  
  # all.each do |cat|
  # Cat.save(cat.name, cat.breed, cat.age, database_connection)
  
  # @@all.each{|item|
      
  #   }
  # Cat.new
  # Cat.save(cat.name, cat.breed, cat.age, database_connection)
   
  def self.all
    @@all
  end
end

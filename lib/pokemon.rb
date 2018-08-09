class Pokemon
  attr_accessor :name, :type, :db, :id, :hp
  @@all = []
  
  def initialize(id: 1, name: "Pokemon name", type: "Pokemon type", db: "db/pokemon.db")
    @id = id 
    @name = name
    @type = type 
    @db = db 
    @@all << self
  end 
  
  def self.all
    @@all
  end 
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end 
  
    def self.find(id, db)
    dbpokemon = db.execute("SELECT name, type FROM pokemon WHERE id = id ")
    self.new(name: dbpokemon[0][0], type: dbpokemon[0][1])  
  end 
end

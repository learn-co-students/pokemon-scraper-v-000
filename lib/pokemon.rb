class Pokemon

  attr_accessor :name, :type, :db

  @@pokemons = []

  def initialize(id, name, type, db)
    @id = id
    @name = name
    @type = type
    @db = db
    @@pokemons << self
  end

  def self.save(name, type, db)
    
    db.execute("INSERT INTO pokemon (name, type) VALUES (name, type)")
  
  end

end

class Pokemon
  attr_accessor :name, :type, :db, :id
  
  def initialize(id:, name:, type:, db:, hp: nil)
    @name=name
    @type=type
    @db=db
    @id=id
    @hp=hp
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)",name, type)
  end
  
  def self.find(id, db)
    pokemons= db.execute("SELECT * FROM pokemon WHERE id=?",id).flatten
    Pokemon.new(id: pokemons[0], name: pokemons[1],type: pokemons[2], db: db)
  end

  
end

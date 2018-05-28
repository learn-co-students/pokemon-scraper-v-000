class Pokemon
  attr_accessor :id, :name, :hp, :type, :db
  @@all = []


  def initialize(id:, name:, type:, hp: 60, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
    @@all << self
  end
  
  def self.save(name, type, db)
  db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(id, db)
    pokemon = db.execute( "SELECT * FROM pokemon WHERE pokemon.id= ?",id).flatten
    name = pokemon[1]
    type = pokemon[2]
    
    pokemon_ins = Pokemon.new(id: id, name: name, type: type, db: db)
  end
  
  def alter_hp(hp, db)
    db.execute( "UPDATE pokemon SET hp = ? WHERE id = ?", hp, id)
  end
end

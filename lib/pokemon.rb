class Pokemon
  attr_accessor :id, :name, :type, :hp, :db
  
  def initialize(id = nil, name = nil, type = nil, hp = nil, db = nil)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end
  
  def self.save(name, type, hp = nil, db)
    if hp == nil
      db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    else
      db.execute("INSERT INTO pokemon (name, type, hp) VALUES (?, ?, ?)", name, type, hp)
    end
  end
  
  def self.find(id, db)
    array = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id).flatten
    id = array[0]
    name = array[1]
    type = array[2]
    hp = array[3]
    
    pokemon = Pokemon.new(id, name, type, hp)
  end
  
  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE pokemon.name = ?", hp, self.name)
  end
end

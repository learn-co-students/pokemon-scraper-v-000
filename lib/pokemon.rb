class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  
  def initialize(id:, name:, type:, db:, hp: nil)
    @id, @name, @type, @db, @hp = id, name, type, db, hp
  end
 
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(id, db)
    pokemon_file = db.execute("SELECT * FROM pokemon WHERE id =?", id).first
    Pokemon.new(id: pokemon_file[0], name: pokemon_file[1], type: pokemon_file[2], hp: pokemon_file[3], db: db)
  end
 
  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end
 
end
class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id: , name: , type: , db: , hp: nil)
   @id = id
   @db = db
   @name = name
   @type = type
   @hp = hp
  end

  def self.save(name, type, db)
     db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id).flatten
    self.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], hp: pokemon_info[3], db: db)
  end

  def alter_hp(hp, db)
     db.execute("UPDATE pokemon SET hp = ? WHERE pokemon.id = ?", hp, self.id)
  end

end
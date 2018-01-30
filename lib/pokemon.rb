class Pokemon
 attr_accessor :id, :name, :type, :db, :hp

 def initialize(id:, name:, type:, db:, hp:60)
  @id = id
  @name = name
  @type = type
  @db = db
  @hp = hp
 end

  def self.find(id,db)
  found_pokemon = (db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?",id)).flatten
  self.new(id:found_pokemon[0], name:found_pokemon[1], type:found_pokemon[2],hp: found_pokemon[3], db:db)
  end

  def self.save(name, type, db)
   db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name,type)
  end

  def alter_hp(new_hp, db)
      db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
    end
  end

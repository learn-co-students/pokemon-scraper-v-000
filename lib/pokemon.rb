class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

def initialize(id:, name:, type:, db:, hp: nil)
@id, @name, @type, @db, @hp = id, name, type, db, hp
end

def self.save(name, type, db)
  db.execute("INSERT INTO pokemon(name, type) VALUES (?,?)", name, type)
end

def self.find(num, db)
  pokemon_sql = db.execute("SELECT * FROM pokemon WHERE id = ?", num).flatten
  Pokemon.new(id: pokemon_sql[0], name: pokemon_sql[1], type: pokemon_sql[2], hp: pokemon_sql[3], db: db)
end

def alter_hp(new_hp, db)
   db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
 end

end

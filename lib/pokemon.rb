class Pokemon
   @@all = []
attr_accessor :id, :name, :type, :db

def initialize(name:, type:, db:, id:)
  @name = name
  @type = type
  @id = id
  @db = db
  @@all << self
end


def self.all
  @@all
end

def self.save(name, type, db)
  db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
end

def self.find(id, db)
	pokemon_array = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
  pokemon_array = pokemon_array.flatten
  pokemon_new = self.new(
    id:pokemon_array[0], 
    name:pokemon_array[1], 
    type:pokemon_array[2], 
    db:@db)
  end 
def alter_hp(hp_b,db)
    db.execute("UPDATE pokemon SET hp=? WHERE id=?;".hp_2.self.id)
  end


end

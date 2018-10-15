class Pokemon
  attr_accessor :id, :name, :type, :db
  
def initialize(id:, name:, type:, db:)
  @id = id
  @name = name
  @type = type
  @db = db
end 

def self.save(name, type, db)
  db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
end 

def self.find(id, db)
  poke = db.execute("SELECT * FROM pokemon WHERE pokemon.id = #{id}")
  other = Pokemon.new(id: poke[0][0], name: poke[0][1], type: poke[0][2], db: db)
  return other
end



end

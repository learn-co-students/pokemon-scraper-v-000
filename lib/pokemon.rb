class Pokemon

attr_accessor :id, :name, :type, :db

@@all = []

def initialize(id:, name:, type:, db:)
@id = id
@name = name
@type = type
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
pokemon_search = db.execute("SELECT * FROM pokemon WHERE pokemon.id = (?)", id).flatten
Pokemon.new(id: pokemon_search[0], name: pokemon_search[1], type: pokemon_search[2], db: db)
end


end

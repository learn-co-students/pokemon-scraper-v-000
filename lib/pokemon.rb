class Pokemon
attr_accessor :id, :name, :type, :db
 @@all = []

 def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
 end

 def self.find(pokemon_id, db)
  found_pokemon = db.execute("SELECT * FROM pokemon WHERE id=?", pokemon_id).flatten
  Pokemon.new(id: found_pokemon[0], name: found_pokemon[1], type: found_pokemon[2], db: db)
 end

 def self.all
   @@all
 end

 def self.save(name, type, db)
   db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
 end

end

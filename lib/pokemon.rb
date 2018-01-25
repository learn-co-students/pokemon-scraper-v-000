class Pokemon
#responsible for saving, adding, removing, or changing anything about each Pokémon
    attr_accessor :name, :type, :db, :id

    def initialize(db)
        @db = db
    end

    def self.save(pk_name, pk_type, db)
        pokemon = Pokemon.new(db)
        pokemon.db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", pk_name, pk_type)
    end

    def self.find(id, db)
        pokemon = Pokemon.new(db)
        pokemon.name = db.execute("SELECT name FROM pokemon WHERE id=?", id).flatten[0]
        pokemon.type = db.execute("SELECT type FROM pokemon WHERE id=?", id).flatten[0]
        pokemon.id = id
        pokemon
    end
end

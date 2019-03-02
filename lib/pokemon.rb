class Pokemon
    attr_accessor :id, :name, :type, :db

    def initialize(pokemon_hash)
        @id = pokemon_hash[:id]
        @name = pokemon_hash[:name]
        @type = pokemon_hash[:type]
        @db = pokemon_hash[:db]
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
    end

    def self.find(id, db)
        pokemon_array = db.execute("SELECT * FROM pokemon WHERE id = ?;", id)
        new_pokemon_id = pokemon_array[0][0]
        new_pokemon_name = pokemon_array[0][1]
        new_pokemon_type = pokemon_array[0][2]
        new_pokemon = self.new({id: new_pokemon_id, name: new_pokemon_name, type: new_pokemon_type})
        new_pokemon
    end

end

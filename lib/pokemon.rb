class Pokemon
    attr_accessor :id, :name, :type, :db, :hp

    def initialize(pokemon_hash)
        @id = pokemon_hash[:id]
        @name = pokemon_hash[:name]
        @type = pokemon_hash[:type]
        @db = pokemon_hash[:db]
        @hp = pokemon_hash[:hp]
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    def self.find(id, db)
        pokemon_array = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
        new_pokemon_id = pokemon_array[0][0]
        new_pokemon_name = pokemon_array[0][1]
        new_pokemon_type = pokemon_array[0][2]
        new_pokemon_hp = pokemon_array[0][3]
        new_pokemon = self.new({id: new_pokemon_id, name: new_pokemon_name, type: new_pokemon_type, hp: new_pokemon_hp})
        new_pokemon
    end
    
    def alter_hp(new_hp, db)
        db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
    end
end

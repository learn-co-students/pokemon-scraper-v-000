require 'pry'
class Pokemon

    attr_accessor :id, :name, :type, :db, :hp

    def initialize(id:, name:, type:, db:, hp:)
        @id = id
        @name = name
        @type = type
        @db = db
        @hp  = hp
   end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type, hp) VALUES (?, ?)",name, type, hp)
    end

    def self.find(id, db)
         newPokemon = db.execute(
        "SELECT name, type, hp FROM pokemon
        WHERE id = ? ", id).flatten
        binding.pry
        Pokemon.new(id: id, name: newPokemon[0], type: newPokemon[1], db: db, hp: hp)
    end
end

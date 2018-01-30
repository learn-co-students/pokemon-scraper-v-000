require 'pry'

class Pokemon
    attr_accessor :id, :name, :type, :db


    def initialize(pokemon)
    pokemon.each {|key,value| self.send(("#{key}="), value)}# if key!=:hp}
    end


    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type)
        VALUES (?, ?)",name, type)
    end

    def self.find(id, db)
      pokemon_row = db.execute("SELECT *
        FROM pokemon
        WHERE id = ?", id).flatten

        Pokemon.new(id: pokemon_row[0], name: pokemon_row[1], type: pokemon_row[2], db: db)
    end
end
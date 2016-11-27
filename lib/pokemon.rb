require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  def initialize(pokemon)
    pokemon.each {|key,value| self.send(("#{key}="), value)}# if key!=:hp}
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
  end

  def self.find(id, db)
    pokemon_array = db.execute("SELECT * FROM pokemon WHERE id = ?;", id).flatten
    self.new(id: pokemon_array[0], name: pokemon_array[1], type: pokemon_array[2], hp: pokemon_array[3], db: db)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ?;", hp)
  end
end

require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  def initialize (pokemon)
    @id = pokemon[:id]
    @name = pokemon[:name]
    @type = pokemon[:type]
    @hp = pokemon[:hp]
    #pokemon[:hp]
    @db = pokemon[:db]
    # remember to also update the initialize method to accept an argument of hp that defaults to nil if not set (so it still passes the non-bonus tests)
  end

  def self.save (name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?",id)
    pokemon = pokemon.flatten
    new_pokemon = {}
    new_pokemon = {id: pokemon[0], name: pokemon[1], type: pokemon[2], hp: pokemon[3], db: "#{db}"}
    self.new(new_pokemon)
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
    self.hp = new_hp
  end

end

require 'pry'

class Pokemon
  attr_accessor :name, :type, :db, :id, :hp

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    pokemon_array = db.execute("SELECT * FROM pokemon WHERE id = #{id}").flatten
    pokemon_hash = {
      :id => id,
      :db => db,
      :name => pokemon_array[1],
      :type => pokemon_array[2]
    }
    Pokemon.new(pokemon_hash)
  end

  def initialize(pokemon_hash)
    @hp = pokemon_hash[:hp]
    @id = pokemon_hash[:id]
    @name = pokemon_hash[:name]
    @type = pokemon_hash[:type]
    @db = pokemon_hash[:db]
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end

end

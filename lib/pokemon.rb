require 'rspec'

class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  @@all = []

  def initialize (pokemon_hash)
    @id = pokemon_hash[:id]
    @name = pokemon_hash[:name]
    @type = pokemon_hash[:type]
    @db = pokemon_hash[:db]
    @hp = pokemon_hash[:hp]
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id, db)
    pokemon_data = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    pokemon_hash = {:id => pokemon_data[0], :name => pokemon_data[1], :type =>pokemon_data[2], :db => db, :hp => pokemon_data[3]}
    self.new(pokemon_hash)
  end

  def alter_hp(hp,db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
    self.hp = hp
  end
end

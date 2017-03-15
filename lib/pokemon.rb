require 'pry'

class Pokemon
  attr_accessor :name, :type, :db, :id, :hp

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save (name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    poke = db.execute("SELECT * FROM pokemon WHERE pokemon.id = id").flatten
    Pokemon.new(id:id, name:poke[1], type:poke[2], hp:poke[3], db:db)
  end

  def alter_hp(hp, db)
 		db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
	end
end

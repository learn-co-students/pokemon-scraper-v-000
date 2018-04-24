require 'pry'
class Pokemon
  attr_accessor :name, :type, :db, :id, :hp

  @@all = []

  def initialize(hp=nil, db)
    @db = db
    @name = name
    @type = type

    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id, db)
    result = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    pokemon = self.new(db)
    pokemon.id = result[0][0]
    pokemon.name = result[0][1]
    pokemon.type = result[0][2]
    pokemon.hp = result[0][3]
    pokemon
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ? ", new_hp, self.id)
  end

end

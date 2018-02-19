require 'pry'

class Pokemon

  attr_accessor :name, :type, :db, :id, :hp

  def initialize(id = nil, name = nil, type = nil, db = nil, hp)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    new_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id).first
    Pokemon.new(@id = new_pokemon[0], @name = new_pokemon[1], @type = new_pokemon[2], @hp = new_pokemon[3])
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, id)
  end

end

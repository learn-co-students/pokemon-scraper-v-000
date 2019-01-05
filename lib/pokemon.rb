require 'pry'

class Pokemon
  
  attr_accessor :id, :name, :type, :hp, :db
  
  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(id, db)
    poke = db.execute("SELECT * FROM pokemon WHERE id = ?", id).first
    Pokemon.new(id: poke[0], name: poke[1], type: poke[2], hp: poke[3], db: db)
  end
  
  def alter_hp(hp = 60, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
  end
  
end

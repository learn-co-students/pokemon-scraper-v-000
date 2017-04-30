require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :hp, :db
  def initialize(id: id, name: name, type: type, hp: nil, db: db)
    self.id = id
    self.name = name
    self.type = type
    self.hp = hp
    self.db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id,db)
    poke = db.execute("SELECT * FROM pokemon WHERE id=?",id)
    id = poke[0][0]
    name = poke[0][1]
    type = poke[0][2]
    hp = poke[0][3]

    pokemon = Pokemon.new(id: id, name: name, hp: hp, type: type)
  end

  def alter_hp(hp,db)
    db.execute("UPDATE pokemon SET hp = ?",hp)
  end
end

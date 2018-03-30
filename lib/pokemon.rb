require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  def initialize(id:, name:, type:, db:, hp:nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    poke = db.execute("SELECT * FROM pokemon WHERE id = ?", id)[0]
    Pokemon.new(id: poke[0], name: poke[1], type: poke[2], db: db, hp:poke[3])
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ?", hp)
  end
end

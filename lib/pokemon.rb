require 'pry'
class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES(?,?)", name, type)
  end

  def self.find(id, db)
    poke = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    # binding.pry
    new_pokemon = Pokemon.new(id: poke[0][0], name: poke[0][1], type: poke[0][2], hp: poke[0][3], db: db)
  end

  def alter_hp(new_hp, db)
    self.hp = new_hp
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end

end

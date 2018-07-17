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
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    found_poke = db.execute("SELECT * FROM pokemon WHERE id = (?)",id)
    Pokemon.new(id: found_poke[0][0], name: found_poke[0][1], type: found_poke[0][2], hp: found_poke[0][3], db: db)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = (?) WHERE id = (?)",hp, self.id)
  end

end

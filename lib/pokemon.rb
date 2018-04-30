require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id = nil, name= nil, type = nil, hp = nil)
    @id = id
    @name = name
    @type = type
    # @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)",name, type)
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end


  def self.find(id, db)
    poke = db.execute("SELECT * FROM pokemon WHERE id = id").flatten
   Pokemon.new(poke[0], poke[1], poke[2], poke[3])
  end



end

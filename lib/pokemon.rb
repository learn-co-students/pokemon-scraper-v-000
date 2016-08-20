require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db, :hp


  def initialize(id, name, type, db, hp=nil)
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
    db.execute("SELECT * FROM pokemon WHERE pokemon.id = (?)", id)
  end

  def self.alter_hp(id, new_hp, db)

    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, id)
  end

end

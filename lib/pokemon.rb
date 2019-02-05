require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db , :hp
  
  @@all = []
  
  def initialize(id:, name:, type:, db: @db, hp:nil)
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
    poke_name = db.execute("SELECT name FROM pokemon WHERE id = ?", id)
    poke_type = db.execute("SELECT type FROM pokemon WHERE id = ?", id)
    poke_hp = db.execute("SELECT hp FROM pokemon WHERE id = ?", id)

    self.new(id: id, name: poke_name[0][0], type: poke_type[0][0], hp: poke_hp[0][0])
  end
  
  def alter_hp(new_hp, db)
    id = self.id
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ? ", new_hp, id)
  end
  
end

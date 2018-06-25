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
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(id, db)
    return_pokemon = db.execute("SELECT * FROM pokemon WHERE Pokemon.id = ?", id).flatten
    id = return_pokemon[0]
    name = return_pokemon[1]
    type = return_pokemon[2]
    hp = return_pokemon[3]
    #binding.pry
    Pokemon.new(id: id, name: name, type: type, db: db, hp: hp)
    #binding.pry
  end
  
  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = #{new_hp} WHERE id = #{self.id}")
  end

end

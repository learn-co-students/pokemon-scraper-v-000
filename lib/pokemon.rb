require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  
  def initialize(id:, name:, type:, db:, hp: NIL)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end
  
  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = (?) WHERE id = (?);", new_hp, self.id)
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end
  
  def self.find(search_id, search_db)
    details = search_db.execute("SELECT * FROM pokemon WHERE id = (?);", search_id)
    if details[0].length > 3
      new_pokemon = Pokemon.new(id: search_id, name: details[0][1], type: details[0][2], hp: details[0][3], db: search_db)
    else
      new_pokemon = Pokemon.new(id: search_id, name: details[0][1], type: details[0][2], db: search_db)
    end
    new_pokemon
  end
end

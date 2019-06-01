require 'pry'
class Pokemon

  attr_accessor :name, :type, :db, :id, :hp

  def initialize(name:, type:, db:, id:, hp:nil)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  #find pokemon in database by their id number
  #return new pokemon object
  def self.find(id, db)
  #  binding.pry
    pokemon_info = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(id:pokemon_info[0], name:pokemon_info[1], type:pokemon_info[2], db:db, hp:pokemon_info[3])
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
  end
end

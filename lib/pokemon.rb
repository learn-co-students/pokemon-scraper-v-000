require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
  end

  def self.find(id, db)
    result = db.execute("SELECT * FROM pokemon WHERE pokemon.id = #{id};")
    new_pokemon = Pokemon.new(id: result[0][0], name: result[0][1], type: result[0][2], db: db)
  end

  def hp
    result = db.execute("SELECT * FROM pokemon WHERE pokemon.id = #{self.id};")
    return result[0][3]
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = #{new_hp} WHERE pokemon.id = #{self.id};")
    result = db.execute("SELECT * FROM pokemon WHERE pokemon.id = #{self.id};")
    #binding.pry
  end
end

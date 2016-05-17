#binding.pry

class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id, name, type, db)
    @id = id
    @name = name
    @type = type
    @db = db
    #binding.pry
  end

  def self.save (name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES ('#{name}', '#{type}');")
  end

  def self.find (id, db)
    db.execute("SELECT pokemon.id, pokemon.name, pokemon.type FROM pokemon WHERE pokemon.id=#{id};")
  end

  def alter_hp (id, new_hp)
    db.execute("UPDATE pokemon SET pokemon.hp = #{new_hp} WHERE pokemon.id=#{id};")
  end

end

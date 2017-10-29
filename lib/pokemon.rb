require "pry"

class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  def initialize(hash)
    @id = hash[:id]
    @name = hash[:name]
    @type = hash[:type]
    @hp = hash[:hp]
    @db = hash[:db]
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id,db)
    pokemon1 = db.execute("SELECT * FROM pokemon WHERE pokemon.id= (?)", id)
    Pokemon.new(id:pokemon1[0][0],name:pokemon1[0][1],type:pokemon1[0][2], hp:pokemon1[0][3], db:db)
  end

  def alter_hp(newhp, db)
    db.execute("UPDATE pokemon SET hp = (?) WHERE name = (?)", newhp, self.name)
  end

end

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

  def self.save(name, type, database_connection)
    database_connection.execute("INSERT INTO pokemon(name, type) VALUES(?,?)",name, type)
  end

  def self.find(number, db)
    poke = db.execute("SELECT * FROM pokemon where id = ?", number).flatten

    Pokemon.new(id:poke[0], name:poke[1], type:poke[2], hp:poke[3], db:db)
  end

  def alter_hp(new_health, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_health, self.id)
  end

end

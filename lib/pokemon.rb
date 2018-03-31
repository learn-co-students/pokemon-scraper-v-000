require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id_num, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id_num)
    Pokemon.new(id:pokemon[0][0], hp:pokemon[0][3], name:pokemon[0][1], type:pokemon[0][2], db:db)
  end

  def initialize(id:, name:, type:, db:, hp: nil)

    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, id)
  end
end

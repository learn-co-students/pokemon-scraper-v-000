require "pry"
class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  def initialize (id: id, name: name, type: type, hp: nil, db: db)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def self.save (name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", [name, type])
  end

  def self.find (id, db)
    poke_array = db.execute("SELECT * FROM pokemon WHERE id = (?)", [id]).flatten
    Pokemon.new(id: poke_array[0], name: poke_array[1], type: poke_array[2], hp: poke_array[3], db: db)
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end

end

require 'pry'
class Pokemon
attr_accessor :db, :name, :type, :id, :hp

  def initialize(name:, type:, id:, db:, hp: nil)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id_input, db)
    pokemon_data = db.execute("SELECT * FROM pokemon WHERE id=?", id_input).flatten
    Pokemon.new(name: pokemon_data[1], type: pokemon_data[2], id: pokemon_data[0], db: db, hp: pokemon_data[3])
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
    # binding.pry
  end

end

require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  def initialize(name:, type:, db:, id:, hp: nil)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO Pokemon (name, type) VALUES (?, ?)", [name, type])
  end

  def self.find(id, db)
    pokemon_data = db.execute("SELECT * FROM Pokemon WHERE pokemon.id = (?)", [id]).flatten
    Pokemon.new(name: pokemon_data[1], type:  pokemon_data[2], id: pokemon_data[0], hp: pokemon_data[3], db: db)
    # binding.pry
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? where id = ?", [new_hp, self.id])
  end

end

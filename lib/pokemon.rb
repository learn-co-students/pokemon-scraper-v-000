require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  #def initialize(id, name = "Pikachu", type = "electric", hp = 0, db = "pokemon.db")
  def initialize(id:, name: "Pikachu", type: "electric", hp: nil, db: "pokemon.db")
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def self.save(name, type, db)
     db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id,db)
    new_pokemon = db.execute("SELECT id, name, type FROM pokemon WHERE id = ?", id).flatten
    #Pokemon.new(id = new_pokemon[0],name = new_pokemon[1],type = new_pokemon[2])
    Pokemon.new(id: new_pokemon[0], name: new_pokemon[1], type: new_pokemon[2])
  end

  def alter_hp(hp, db)
    db.execute( "UPDATE pokemon SET hp = ? WHERE id = ?", [hp, self.id])
    #binding.pry
  end




end

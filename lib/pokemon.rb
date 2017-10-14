require 'pry'

class Pokemon
  attr_accessor :id,:hp,:name,:type,:db

  def initialize(id: 1,hp: 60,name: "name",type: "type",db: "db")
    #binding.pry
    @id = id
    @hp = hp
    @name = name
    @type = type
    @db = db
  end

  def self.save(name,type,db)
    db.execute("INSERT INTO pokemon (name,type) VALUES (?,?);",[name,type])
  end

  def self.find(id,db)
    pokemon_db = db.execute("SELECT * FROM pokemon WHERE id = #{id}")
    new_pokemon = Pokemon.new(id: pokemon_db[0][0],name: pokemon_db[0][1],type: pokemon_db[0][2],hp: pokemon_db[0][3], db: db)
    #binding.pry
    new_pokemon
  end

  def alter_hp(hp,db)
    db.execute("UPDATE pokemon SET hp = #{hp} WHERE name = ?",[@name])
    testdb = db.execute("SELECT * FROM pokemon;")
    #binding.pry
  end

end

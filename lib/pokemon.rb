require 'pry'
class Pokemon
  attr_accessor :id,:name,:type,:db,:hp

  def initialize(id=nil,name=nil,type=nil,hp=nil,db=nil)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db

  end

  def self.save(name,type,db)
    db.execute("INSERT INTO pokemon (name,type) VALUES (?, ?)",name,type)
  end
  def self.find(id,db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = (?)",id)
    pokemon = pokemon.flatten
    Pokemon.new(pokemon[0],pokemon[1],pokemon[2],pokemon[3])
    # binding.pry
  end
  def alter_hp(hp,db)
    db.execute("UPDATE pokemon SET hp = (?)",hp)
  end



end

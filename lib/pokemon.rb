#require 'pry'
class Pokemon
  attr_accessor :db,:id,:name,:type,:hp

  def initialize(db:,id:,name:,type:,hp: nil)
    @db = db
    @id = id
    @name = name
    @type = type
    @hp = hp
  end

  def self.save(name,type,db)
    db.execute("INSERT INTO pokemon (name,type) VALUES (?,?);",name,type)
  end

  #creates and returns a new Pokemon object based on id in db
  def self.find(id,db)
    item_found = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?;",id)
    id = item_found[0][0]
    name = item_found[0][1]
    type = item_found[0][2]
    hp = item_found[0][3]
    pokemon = Pokemon.new(id: id,name: name,type: type, db: db,hp: hp)
  end

  def alter_hp(new_hp,db)
    @hp = new_hp
    db.execute("UPDATE pokemon SET hp = ? WHERE pokemon.id = ?;",new_hp,@id)
  end
end

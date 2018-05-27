require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  @@all = []
  def initialize(id:, name:, type:, db:, hp: nil )
  @id = id
  @name = name
  @type = type
  @db = db
  @hp = hp
  @@all << self
  end
 def self.all
   @@all
 end

 def self.save(name, type, db)
   db.execute("INSERT INTO pokemon(name,type) VALUES (?,?)",name,type)
 end

 def self.find(id, db)
  pokemon = db.execute( "SELECT * FROM pokemon WHERE pokemon.id= ?",id).flatten
  self.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], hp: pokemon[3],db: pokemon[4] )
 end

 def alter_hp(hp, db)
   db.execute( "UPDATE pokemon SET hp = ? WHERE id = ?", hp, id)
 end
end

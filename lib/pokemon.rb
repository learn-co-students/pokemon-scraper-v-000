require 'pry'
class Pokemon

attr_accessor :id, :name, :type, :db, :hp

 @@all = []

  def initialize (id:, name:, type:, hp: nil, db:)
    @id, @name, @type, @hp, @db = id, name, type, hp, db
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id, db)
    pokemon_finder = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    found = Pokemon.new(id: pokemon_finder[0], name: pokemon_finder[1], type: pokemon_finder[2], hp: pokemon_finder[3], db: db,)
    found
  end

  def alter_hp(hp,db)
      altered_hp = db.execute("UPDATE pokemon SET hp = ? WHERE id = ?",hp,self.id)
      altered_hp
      #binding.pry

  end


end

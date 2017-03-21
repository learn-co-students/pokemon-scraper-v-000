require 'pry'
class Pokemon
  attr_accessor :name, :type, :db, :id, :hp
  @@all =[]


  def initialize(id = "", name = "", type = "", hp = "", db = "")
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp
    @@all << self
  end

  def self.save(name, type, database_connection)
    database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.all
    @@all
  end

  def self.find(id, db)
    info = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?",id).flatten
    pokemon = Pokemon.new(id = info[0], name = info[1], type = info[2], hp = info[3], db = db)
    # binding.pry
    pokemon
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, @id)
  end

end

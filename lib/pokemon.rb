require 'pry'

class Pokemon
  @@all = []
  attr_accessor :id, :name, :type, :db #, :hp

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
  end

  def self.all
    @@all
   end


  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id, db)
  #binding.pry
    find_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    name = find_pokemon[1]
    type = find_pokemon[2]
    create_pokemon = Pokemon.new(id: id, name: name, type: type, db: db)
  end

#  def alter_hp(hp)
#   db.execute
#  end


end

require "pry"
class Pokemon
  attr_accessor :id, :name, :type, :hp, :db
  @@all = []
  def initialize(id, name = "", type = "", hp = nil)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, database_connection)
    database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, database_connection)
    found_pokemon = (database_connection.execute("SELECT * FROM pokemon WHERE (id=1)"))
    Pokemon.new(found_pokemon[0][0], found_pokemon[0][1],found_pokemon[0][2], found_pokemon[0][3])
  end
end

require "pry"
class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  @@all = []

  def initialize (id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
    @@all << self
  end

  def alter_hp(hp, database_connection)
    database_connection.execute("UPDATE pokemon SET hp = ? WHERE id = ? ", hp, self.id)
  end

  def self.all
    @@all
  end

  def self.find(id, database_connection)
    pokemon_by_id = database_connection.execute("SELECT * FROM pokemon WHERE id =?", id).flatten
    Pokemon.new(id: pokemon_by_id[0], name: pokemon_by_id[1], type: pokemon_by_id[2], hp: pokemon_by_id[3], db: database_connection)
  end

  def self.save (name, type, database_connection)
    database_connection.execute("INSERT INTO pokemon (name, type) VALUES ( ?, ?)", name, type)
  end

end

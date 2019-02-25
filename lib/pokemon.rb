require "pry"

class Pokemon
  attr_reader :id, :name, :type, :hp, :db
  @@all = []

  def initialize (id:, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
    @@all << self
  end

  #def self.all
    #@@all
  #end

  def self.save(name, type, database_connection)
    database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, database_connection)
    pokemon = database_connection.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    name = pokemon[1]
    type = pokemon [2]
    hp = pokemon[3]

    pokemon_inst = Pokemon.new( id: id, name: name, type: type, hp: hp, db: database_connection)

  end

end

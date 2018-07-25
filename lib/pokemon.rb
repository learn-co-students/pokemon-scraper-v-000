require 'pry'

class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  @@all = []
  def self.all
    @@all
  end

  def initialize(id:nil,name:nil,type:nil,db:nil)

    @id = id
    @name = name
    @type = type
    @db = db
    @hp = 60
    @@all << self

  end

  def self.save(name, type, database_connection)

    database_connection.execute("INSERT INTO pokemon (name, type) VALUES ( ?, ?)" ,name, type)

  end

  def self.find(id,db)

    pokemon_db = db.execute("SELECT * FROM pokemon WHERE pokemon.id = id")

    pokemon_ob = self.new

    begin
    db.execute("SELECT hp FROM pokemon")
    rescue

    else
    db.execute("INSERT INTO pokemon (hp) VALUES (60)")
  #  binding.pry
    end
    #binding.pry

    pokemon_ob.id = pokemon_db[0][0]
    pokemon_ob.name = pokemon_db[0][1]
    pokemon_ob.type = pokemon_db[0][2]
    pokemon_ob.db = db

    pokemon_ob
  end

end

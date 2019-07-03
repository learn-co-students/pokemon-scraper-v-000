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
    @@all << self

  end

  def self.save(name, type, database_connection)

    database_connection.execute("INSERT INTO pokemon (name, type) VALUES ( ?, ?)" ,name, type)

    begin
    database_connection.execute("SELECT hp FROM pokemon")
  #  binding.pry
    rescue

    else
    database_connection.execute("UPDATE pokemon SET hp = 60")
  #  binding.pry
    end

  end

  def self.find(id,db)

    pokemon_db = db.execute("SELECT * FROM pokemon WHERE pokemon.id = id")

    pokemon_ob = self.new

    begin
    db.execute("SELECT hp FROM pokemon")
  #  binding.pry
    rescue

    else
    pokemon_ob.hp = pokemon_db[0][3]
  #  binding.pry
    end
  #  binding.pry
    pokemon_ob.id = pokemon_db[0][0]
    pokemon_ob.name = pokemon_db[0][1]
    pokemon_ob.type = pokemon_db[0][2]
    pokemon_ob.db = db

    pokemon_ob
  end

  def alter_hp(hp, db)
    if db != nil
      begin
        db.execute("SELECT hp FROM pokemon")
      rescue
        puts "No hp added"
      else
        #binding.pry
        db.execute("UPDATE pokemon SET hp = (#{hp}) WHERE name = '#{self.name}'")
        @hp = hp
      end

    end
  end

end

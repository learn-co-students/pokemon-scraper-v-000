require 'pry'
class Pokemon

  db = SQLite3::Database.new("db/pokemon.db")

  attr_accessor :type, :db, :name, :id

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db

  end

  def self.save(name, type, db)
    #db.execute("CREATE TABLE IF NOT EXISTS pokemon(id INTEGER PRIMARY KEY, name TEXT, type TEXT);")
    db.execute("INSERT INTO pokemon(name, type) VALUES(?,?);", name, type)
  end

  def self.find(id, db)
    pokemon_selected = db.execute("SELECT * FROM pokemon WHERE pokemon.id =?;", id).flatten
  #binding.pry
  new_pokemon = self.new(id:pokemon_selected[0],name:pokemon_selected[1],type:pokemon_selected[2],db:db)
  end


end

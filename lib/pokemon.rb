require 'pry'
class Pokemon
  attr_accessor :name, :type, :db, :id
  #pokemon_connection = SQLite3::Database.new('db/pokemon.db') is not needed because
  #Note We have set up your scraper class for you, which you can see in lib/scraper.rb.
  #We have also created a schema_migration.sql file
  # that will run the SQL statement to set up your database in db/pokemon.db.
  # Your only job is to build out the methods to save and find pokemon in the database.

  def initialize(name:,type:,db:,id:) #This is a keyword. It is used for mass assignment

    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name,type,db)
    #^^^
    #These are the values that will be assigned to the keys so they don't need to be keywords.

    #pokemon_connection.execute("INSERT INTO pokemon (name,type,db) VALUES (?,?,?)", name, type, db)
    #last section was wrong don't listen to them
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type )
    #the methods are done on the database.
  end
#THIS IS NOT ^
#  def self.save
#    @@class_array << self
#  end


  def self.find(id,db)
    variable = db.execute("SELECT name, type FROM pokemon WHERE id = ?", id)
    #is a nested array  [["Pikachu", "electric"]]
    #binding.pry
    name = variable[0][0]
    type = variable[0][1]
    self.new(name: name,type: type,db: db,id: id)
  end
end

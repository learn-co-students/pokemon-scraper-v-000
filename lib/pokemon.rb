require 'pry'
class Pokemon
  attr_accessor :name,:type,:db, :id,:hp
  BONUS=60

  def initialize(name,type="",db="")
    @name=name
    @type=type
    @db=db
    #@hp=BONUS
    self
    #@id=db.execute("SELECT count() FROM pokemon")[0][0]+1
  end

  def self.save(name,type, db)
    #database_connection=SQLite3::Database.new('./db/pokemon.db')
    #database_connection.execute("CREATE TABLE IF NOT EXISTS pokemon(id INTEGER PRIMARY KEY, name TEXT, type TEXT)")
    id=db.execute("SELECT count() FROM pokemon")[0][0]+1
    db.execute("INSERT INTO pokemon (id,name,type) VALUES(?,?,?)", id,name,type)
  end

  def self.find(id,db)
    pokemon=db.execute("SELECT name, type FROM pokemon WHERE id=?", id)
    new_pokemon=new(pokemon[0][0], pokemon[0][1], db)
    new_pokemon.id=id
    new_pokemon
  end

#  def create_hp_column
#    puts db.execute("SELECT * FROM pokemon")
#    @db.execute("ALTER TABLE pokemon ADD COLUMN hp INTEGER DEFAULT 60;")
#    puts db.execute("SELECT * FROM pokemon")
#  end

 def change_hp(hp)
   @hp=hp
 end


  def alter_hp(hp,db)
    db.execute("UPDATE pokemon SET hp=? WHERE name=?;",hp,@name)
    #id=db.execute("SELECT id FROM pokemon WHERE name='Pikachu'")[0][0]
    @hp=hp
    binding.pry

    puts Pokemon.find(1, @db).name
  end

end

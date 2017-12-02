require 'pry'
class Pokemon
  attr_accessor :name,:type,:db, :id,:hp
  BONUS=60

  def initialize(id:, name:,type:, hp:nil, db:)
    @id=id
    @name=name
    @type=type
    @db=db
    @hp=hp
    self
    #@id=db.execute("SELECT count() FROM pokemon")[0][0]+1
  end

  def self.save(name,type, db)
    #database_connection=SQLite3::Database.new('./db/pokemon.db')
    #database_connection.execute("CREATE TABLE IF NOT EXISTS pokemon(id INTEGER PRIMARY KEY, name TEXT, type TEXT)")
    #id=db.execute("SELECT count() FROM pokemon")[0][0]+1
    db.execute("INSERT INTO pokemon (name,type) VALUES(?,?)", name,type)
  end

  def self.find(id,db)
    pokemon=db.execute("SELECT * FROM pokemon WHERE id=?", id)
    Pokemon.new(id:pokemon[0][0], name:pokemon[0][1], type:pokemon[0][2], hp:pokemon[0][3], db:db)
    #new_pokemon.alter_hp(59,db)
    #new_pokemon.id=id
    #new_pokemon
  end

#  def create_hp_column
#    puts db.execute("SELECT * FROM pokemon")
#    @db.execute("ALTER TABLE pokemon ADD COLUMN hp INTEGER DEFAULT 60;")
#    puts db.execute("SELECT * FROM pokemon")
#  end

 #def change_hp(hp)
  # @hp=hp
 #end


  def alter_hp(hp,db)
    #db.execute("ALTER TABLE pokemon ADD COLUMN hp INTEGER DEFAULT 60 END;") unless db.execute("SELECT hp FROM pokemon")==nil
    db.execute("UPDATE pokemon SET hp=? WHERE id=?;",hp,self.id)
    #id=db.execute("SELECT id FROM pokemon WHERE name='Pikachu'")[0][0]
    #if @name='Pikachu' {@hp=hp}
    #puts Pokemon.find(1, @db).name
    #puts self.hp

  end

end

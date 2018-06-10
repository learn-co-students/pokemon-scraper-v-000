require 'pry'
class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(name,type=nil,db=nil,hp=nil)
    @name = name
    @type=type
    @hp=hp
    @db=SQLite3::Database.new("db/pokemon.db")
  end

  def self.save(name,type,db)
    my_pok=Pokemon.new(name)
    my_pok.type=type
    pok_data=[my_pok.name, my_pok.type] #an array to iteratively add
    ins=db.prepare('INSERT INTO pokemon(name,type) VALUES (?,?)')
    ins.execute(pok_data)
  end

  def self.find(id,db)
    data=db.execute("SELECT * FROM pokemon WHERE id=(?)",id).flatten
    #This is a little cringey right here...
    pok=Pokemon.new(data[1],data[2])
    pok.id=data[0]
    pok.hp=data[3]
    pok
  end

  def alter_hp(newhp,db)
    @hp=newhp
    db.execute("UPDATE pokemon SET hp=(?) WHERE id=(?)",newhp,self.id)
  end




end

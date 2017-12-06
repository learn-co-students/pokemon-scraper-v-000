class Pokemon

attr_accessor :id, :name,:type, :db, :hp

  #ALTER TABLE pokemon ADD COLUMN hp INTEGER DEFAULT 60;
  def initialize(hp=nil)
    @db = db
    @id = id
    @name = name
    @type = type
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name,type) VALUES (?,?)",name, type)

  end

  def self.find(id_num,db)
    #binding.pry
    result = db.execute("SELECT * from pokemon where id=?",id_num).flatten
    #binding.pry
    pokemon = Pokemon.new
    pokemon.id = result[0]
    pokemon.name = result[1]
    pokemon.type = result[2]
    pokemon.hp = result[3]
    pokemon
  end

  def alter_hp(new_hp,db)
    #binding.pry
    db.execute("UPDATE pokemon set hp=? where id=?",new_hp,self.id)

  end

end #ends Pokemon class

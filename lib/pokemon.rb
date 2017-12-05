class Pokemon

attr_accessor :id, :name,:type, :db, :hp

  #ALTER TABLE pokemon ADD COLUMN hp INTEGER DEFAULT 60;
  def initialize
    @db = db
    @id = id
    @name = name
    @type = type
    @hp = hp
  end

  def self.save(name, type,db)
    db.execute("INSERT INTO pokemon (name,type) VALUES (?,?)",name, type)
  end

  def self.find(id_num,db)
    result = db.execute("SELECT * from pokemon where id = ?",id_num).flatten
    pokemon = Pokemon.new
    pokemon.id = result[0]
    pokemon.name = result[1]
    pokemon.type = result[2]
    pokemon.db = db
  end

  def alter_hp(new_hp,id_num)
    db.execute("UPDATE pokemon set hp=? where id =?)",new_hp,id_num)
  end

end #ends Pokemon class

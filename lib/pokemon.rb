class Pokemon

attr_accessor :id, :name,:type, :db, :hp

  def initialize(id)
    @db = db
    @id = id
    @name = name
    @type = type
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name,type,hp) VALUES (?,?)",name, type)
  end

  def self.find(id_num,db)
    db.execute("SELECT * from pokemon where id = ?",id_num)
  end

  def alter_hp(new_hp,id_num)
    db.execute("UPDATE pokemon set hp=? where id =?)",new_hp,id_num)
  end

end #ends Pokemon class

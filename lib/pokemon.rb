class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id, pk_name, pk_type, db, hp)
    @id = id
    @name = pk_name
    @type = pk_type
    @db = db
    @hp = hp
  end

  def self.save(name,type,db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)",name,type)
  end

  def knows_default_hp(db)
    db.execute("SELECT hp FROM pokemon where id = ?",self.id)
  end

  def self.find(id,db)
    pokemon_info = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
  end

  def alter_hp(new_hp,db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
    @hp = new_hp
  end
end

class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id, pk_name, pk_type, db)
    @id = id
    @name = pk_name
    @type = pk_type
    @db = db
  end

  def self.save(name,type,db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)",name,type)
  end

  def self.find(id_num,db)
    db.execute("SELECT * FROM pokemon WHERE id = ?", id_num)
  end

  def alter_hp(new_hp,db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end
end

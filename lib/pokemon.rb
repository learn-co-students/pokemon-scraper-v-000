class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  def initialize(id, name, type, db)
    @id = id
    @name = name
    @type = type
    @db = db
    
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id_num, db)
    pikachu_from_db = db.execute("SELECT * FROM pokemon WHERE id=?", id_num)
  end

  

  def alter_hp(new_hp)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, id)
  end
end
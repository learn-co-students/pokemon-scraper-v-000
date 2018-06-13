class Pokemon
  
  attr_accessor :id, :name, :type, :db, :hp
  
  def initialize(id:, name: nil, type: nil, db: nil, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end
  
  def self.find(id, db)
    result = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(id: result[0], name: result[1], type: result[2], hp: result[3], db: db)
  end
  
  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end
  
end

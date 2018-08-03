class Pokemon
  attr_accessor :name, :type, :id, :db, :hp
  
  def initialize(id:, name:, type:, hp: 60, db:)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(id, db)
    result = db.execute("SELECT * FROM pokemon WHERE id = (?)", id)
    Pokemon.new(id: result[0][0], name: result[0][1], type: result[0][2], hp: result[0][3], db: db)
  end
  
  def alter_hp(updated_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", updated_hp, @id)
  end
end

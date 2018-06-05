class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  
  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp 
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(id, db)
   rec = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
   Pokemon.new(id: rec[0][0], name: rec[0][1], type: rec[0][2], db: db, hp: rec[0][3])
  end
  
  def alter_hp(new_hp, db)
    # binding.pry
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
    # binding.pry
  end
end

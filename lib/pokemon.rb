class Pokemon
  
  attr_accessor :id, :name, :type, :db, :hp 
  @@all = []
  
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
    a = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(id: a[0], name: a[1], type: a[2], hp: a[3], db: db) 
  end 
  
  def self.all 
    @@all 
  end 
  
  def alter_hp(hp, db) 
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
  end 
end

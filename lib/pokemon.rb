class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  
  @@all = []
  
  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name 
    @type = type
    @hp = hp
    @db = db
    @@all << self
  end 
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end 
  
  def self.find(id, db)
   pk = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
   name = pk[1]
   type = pk[2]
   hp = pk[3]
   Pokemon.new(id: id, name: name, type: type, hp: hp, db: db)
    
  end   
  
  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = #{self.id}", hp)
    
  end 
  
end

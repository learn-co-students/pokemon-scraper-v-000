class Pokemon
attr_accessor :id, :name, :type, :db, :hp


  @@all = []
  
  def initialize(id,name,type,db)
    
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
  end

  def self.find(id,db)
    db.execute("SELECT * FROM pokemon WHERE id = (?)",id)
  
  end
  
  def self.all
    @@all
  end

  def alter_hp(hp)
    @hp = hp
    db.execute("INSERT INTO pokemon (hp) VALUES (?)",hp)

  end
 
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end
end



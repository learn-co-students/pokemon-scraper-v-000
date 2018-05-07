class Pokemon
  
  attr_accessor :name, :type, :db, :id, :hp
  
  @@all = []
  
  def initialize(id:, name:, type:, db:, hp: nil)
    @db = db
    @id = id
    @name = name
    @type = type
    @hp = hp
    @@all << self
  end
  
  def self.all 
    @@all
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(id, db) 
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
     self.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], db: db, hp: 60)
  end
  
  def alter_hp
    db.execute()
  end
  
end

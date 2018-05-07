class Pokemon
  
  attr_accessor :name, :type, :db, :id, :hp
  
  @@all = []
  
  def initialize(id:, name:, type:, hp: nil, db:)
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
     self.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], hp: pokemon[3], db: db)
  end
  
  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end
  
end

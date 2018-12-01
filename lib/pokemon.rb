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
    insert = db.prepare("INSERT INTO pokemon (name, type) VALUES (?, ?);")
    insert.execute(name, type)
  end
  
  def self.find(id, db, hp = 60)
    found_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?;", id).flatten
    
    self.new(id: found_pokemon[0], name: found_pokemon[1], type: found_pokemon[2], db: db, hp: hp)
  end
end

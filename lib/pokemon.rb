class Pokemon
  attr_accessor :id, :name, :type, :hp, :db 
  
  def initialize(id:, name:, type:, hp: nil, db:)
    @id = id 
    @name = name 
    @type = type 
    @hp = hp
    @db = db
  end
  
  def self.save(name, type, db)
    insert = db.prepare("INSERT INTO pokemon (name, type) VALUES (?, ?);")
    insert.execute(name, type)
  end
  
  def self.find(id, db)
    found_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?;", id).flatten
    
    self.new(id: found_pokemon[0], name: found_pokemon[1], type: found_pokemon[2], hp: found_pokemon[3], db: db)
  end
  
  def alter_hp(hp, db)
    change_hp = db.prepare("UPDATE pokemon SET hp = ? WHERE id = ?;")
    change_hp.execute(hp, self.id)
  end
end

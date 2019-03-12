class Pokemon
  
  attr_accessor :id, :name, :type, :db, :hp
  
  @@all = []
  
  def initialize (id:, name:, type:, db:, hp:nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
    @@all << self
  end
  
  def self.save (name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(id, db)
    pokemon = db.execute("select * from pokemon where id = ?", id).flatten
    name = pokemon[1]
    type = pokemon[2]
    hp = pokemon[3]
    Pokemon.new(id: id, name: name, type: type, db: db, hp: hp)
  end
  
  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ?", new_hp)
  end
    
end
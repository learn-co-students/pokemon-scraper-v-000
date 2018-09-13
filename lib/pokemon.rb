class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  
  @@all = []
  
  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
    @@all << self
  end 
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(id, db)
    pokemon_array = db.execute("SELECT * FROM pokemon WHERE id = (?)", id).flatten
    self.new(id: id, name: pokemon_array[1], type: pokemon_array[2], db: db, hp: 60)
  end
  
  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
  end
  
end

class Pokemon
  
  attr_accessor :id, :name, :type, :db, :hp
  
  @@all = []
  
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type) 
  end
  
  def self.find(id, db)
    statement = db.prepare("SELECT * FROM pokemon WHERE id = ?")
    result_set = statement.execute(id)

    results = result_set.collect do |row|
      pokemon = Pokemon.new(name: row[1], type: row[2], db: db, id: id)
      pokemon.hp = row[3]
      pokemon
    end
    results[0]
  end
  
  def alter_hp(hp, db)
    statement = db.prepare("UPDATE pokemon SET hp=? WHERE id=?")
    statement.execute(hp,self.id)
  end
  
end

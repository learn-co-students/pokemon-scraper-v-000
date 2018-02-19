class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  
  @@all = []
  def initialize(name:, type:, db:, id:, hp: nil)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp
    @@all << self
  end
  
  def self.save(name, type, db)
    @vals = db.execute("INSERT INTO pokemon (id, name, type) VALUES (?, ?, ?)", [@id,name,type])
  end
  
  def self.find(id, db)
    vals = db.execute("SELECT pokemon.id, pokemon.name, pokemon.type FROM pokemon WHERE pokemon.id = ?", id)
    newpoke = self.new(id: vals[0][0], db: db, name: vals[0][1], type: vals[0][2])
    #found = @@all.detect{|i| i.id = id}
  end
   
  def self.all
    @@all
  end
  
  def alter_hp(amt, db)
    found = @@all.detect{|i| i.id == 1}
    #found = self.class.find(1, db)
    #binding.pry
    db.execute("UPDATE pokemon SET hp = ? WHERE pokemon.id = 1;", amt)
    #db.execute("UPDATE pokemon SET hp = ? WHERE pokemon.id = ?;", [0, self.id + 1])
    found.hp = amt
    #binding.pry
  end
end
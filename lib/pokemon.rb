class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  
  @@all = []
  def initialize(name:, type:, db:, id:, hp: nil)
    @name = name
    @type = type
    @db = db
    @id = id
    @@all << self
  end
  
  def self.save(name, type, db)
    #@id += 1
    @vals = db.execute("INSERT INTO pokemon (id, name, type) VALUES (?, ?, ?)", [@id,name,type])
  end
  
  def self.find(id, db)
    vals = db.execute("SELECT pokemon.id, pokemon.name, pokemon.type FROM pokemon WHERE pokemon.id = ?", id.to_i)
    #binding.pry
    #@id = id
    newpoke = self.new(id: vals[0][0], db: db, name: vals[0][1], type: vals[0][2])
    # vals.each{|item|
    #   self.new(id: @@id, name: vals[1], type: vals[2], hp:60)
    #   #binding.pry
    # }
    #found = @@all.detect{|i| i.id = id}
  end
  
  # The find method should create a new Pokemon object with an id, type, name AND hp after selecting their row from the database by their id number.
  # remember to also update the initialize method to accept an argument of hp that defaults to nil if not set (so it still passes the non-bonus tests)
  
  # all.each do |cat|
  # Cat.save(cat.name, cat.breed, cat.age, database_connection)
  
  # @@all.each{|item|
      
  #   }
  # Cat.new
  # Cat.save(cat.name, cat.breed, cat.age, database_connection)
   
  def self.all
    @@all
  end
  
  def alter_hp(amt, db)
    #binding.pry
    db.execute("UPDATE pokemon SET hp = ?;", amt.to_i)
    self.hp = amt
  end
end
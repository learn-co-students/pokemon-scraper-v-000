class Pokemon
    attr_accessor :id, :name, :type, :db, :hp
    @@all = []
    
  def initialize(name = nil, type = nil, db)
      @id = id 
      @hp = 60
      @name = name
      @type = type
      @db = db 
  end# of initialize 
  
  
  def self.all
      @@all
  end# of self.all
  
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
  end# of save 
  
  
  def self.find(id, db)
    query = db.execute("SELECT * FROM pokemon WHERE id = ?;", id).flatten

      if @@all.none? {|pokemon| pokemon.id == id}
          pokemon = Pokemon.new(query[1], query[2], db)
          pokemon.id = id
          @@all << pokemon 
          pokemon
      else 
        @@all[id - 1]

      end# of if 
  end# of self.find
  
  
  def alter_hp(update, db)
    db.execute("UPDATE pokemon SET hp = (?) WHERE name = (?);", update, self.name)
    self.hp = update 
  end# of alter_hp
  
  
end# of class 
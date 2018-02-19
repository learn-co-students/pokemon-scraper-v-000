class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  
  # @@all = []
  def initialize(name:, type:, db:, id:, hp: nil)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp
    # @@all << self
  end
  
  def self.save(name, type, db)
    @vals = db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(id, db)
    vals = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id).flatten
    newpoke = self.new(id: vals[0], db: db, name: vals[1], type: vals[2], hp: vals[3])
    #binding.pry
    #found = @@all.detect{|i| i.id = id}
  end
   
  # def self.all
  #   @@all
  # end
  
  def alter_hp(amt, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", amt, self.id)
    self.hp = amt
    #binding.pry
  end
end
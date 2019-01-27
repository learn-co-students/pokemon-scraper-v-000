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
  
  def self.all
    @@all
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(id, db)
    if self.all.detect {|p| p.id == id}
      pokemon = self.all.detect {|p| p.id == id}
    else
      name = db.execute("SELECT name FROM pokemon WHERE id = ?", id).flatten[0]
      type = db.execute("SELECT type FROM pokemon WHERE id = ?", id).flatten[0]
      pokemon = self.new(id: id, name: name, type: type, db: db)
    end
    pokemon
  end
  
  def alter_hp(new_hp, db)
    id = self.id
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, id)
    @hp = new_hp
  end
  
end
class Pokemon

  @@all = []

  attr_accessor :name, :type, :db, :id, :hp

  def initialize(id, hp = nil)
    @id = id
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (? ,?)", name, type)
  end

  def self.find(id, db)
    poke = self.new(id)
    poke.name = db.execute("SELECT name FROM pokemon WHERE id = ?", id).flatten.first
    poke.type = db.execute("SELECT type FROM pokemon WHERE id = ?", id).flatten.first
    poke
  end

end

class Pokemon

  @@all = []

  def initialize(id, name, type, db)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
  end

  def self.save(name, type, db)
     db.execute("INSERT INTO cats (name, type, db) VALUES (?, ?, ?)",name, type, db)
  end

  def self.find(name, type, db)
    db.execute("SELECT * FROM #{db} WHERE name = '#{name}'")
  end
end

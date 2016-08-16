class Pokemon

  attr_accessor :name, :type, :db, :id

  def initialize (name, type, db, id)
     @name = name
     @type = type
     @db = db
     @id = id
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    db.execute("SELECT id, name, type FROM pokemon")
  end
end

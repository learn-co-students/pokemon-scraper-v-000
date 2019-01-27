class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(id, db)
    name = db.execute("SELECT name FROM pokemon WHERE id = ?", id)
    type = db.execute("SELECT type FROM pokemon WHERE id = ?", id)
    self.new(id: id, name: name, type: type, db: db)
  end
  
end

class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id, name, type, db)
    self.id = id
    self.name = name
    self.type = type
    self.db = db
  end

  def self.save(name, type, database)
    database.execute("INSERT INTO Pokemon (name, type) VALUES (?, ?)",name,type)
  end

  def self.find(id, database)
    database.execute("SELECT * FROM pokemon WHERE pokemon.id = id")
  end
end

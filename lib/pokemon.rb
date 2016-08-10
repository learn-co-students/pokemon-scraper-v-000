class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id, name, type, db)
    self.id = id
    self.name = name
    self.type = type
    self.db = db
  end

  def self.find(id, db)
    db.execute("SELECT * FROM pokemon WHERE pokemon.id = (?)", id).flatten
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
end

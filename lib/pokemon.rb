class Pokemon
  attr_accessor :name, :type, :id, :db

  def initialize(*args)
    id, name, type, db = *args
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id)
  end
end

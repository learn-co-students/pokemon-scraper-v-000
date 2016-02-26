class Pokemon

  attr_reader :name, :type, :db

  def initialize(id, name, type, db)
    @id, @name, @type, @db = id, name, type, db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id).first
  end

end

class Pokemon
  attr_accessor :name, :type
  attr_reader :id, :db

  def initialize(id, name, type, db)
    @name = name
    @type = type
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
  end
end

class Pokemon
  attr_accessor :name, :type, :db

  def initialize(id, name, type, db)
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute('INSERT INTO pokemon (name, type) VALUES (?, ?)', name, type)
  end

  def self.find(id, db)
    found = db.execute('SELECT * FROM pokemon WHERE pokemon.id = ?', id)
    found.first
  end
end

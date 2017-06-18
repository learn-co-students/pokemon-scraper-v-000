class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize(id: nil, name: nil, type: nil, db: nil)
    self.id = id
    self.name = name
    self.type = type
    self.db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    pokemon_1 = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(id: pokemon_1[0], name: pokemon_1[1], type: pokemon_1[2], db: db)
  end

end

class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize(id = nil, name = nil, type = nil, db)
    self.id = id
    self.name = name
    self.type = type
    self.db = db
  end

  def self.save(id = nil, name, type, db)
    poke = Pokemon.new(id, name, type, db)
    poke.db.execute( "INSERT INTO pokemon (name, type) VALUES ( ?, ?)", [name, type])
  end

  def self.find(id, db)
    poke_info = db.execute("SELECT * FROM pokemon WHERE id = (?)", [id]).flatten
    Pokemon.new(poke_info[0], poke_info[1], poke_info[2], db)
  end

end

class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id, name, type, db, hp = 60)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp  = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name,type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    pokemon_info = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id)
  end

end

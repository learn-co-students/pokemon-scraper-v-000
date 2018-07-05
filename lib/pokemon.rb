class Pokemon

  @@all = []

  def initialize(name, type, id, db)
    @name = name
    @type = type
    @id = id
    @db = db
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    new_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    pk_name = new_pokemon[0][1]
    pk_type = new_pokemon[0][2]
    self.new(pk_name, pk_type, id, db)
  end

end

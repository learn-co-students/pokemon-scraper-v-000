class Pokemon
attr_accessor :name, :type, :db
  @@all = []

  def initialize(id, name, type, db)
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    # saves and instance of a pokemon with the correct id
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    # finds a pokemon from the database
    db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id).first
  end

end

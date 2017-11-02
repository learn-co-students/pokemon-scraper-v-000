class Pokemon
  attr_accessor :id, :name, :type, :db

  @@all = []

  def initialize(name)
    @name = name
    @type = type
    @db =db
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name , type)
  end

  def self.find(id, db)
    "SELECT pokemon.name FROM db
    WHERE pokemon.id = id"
  end
end

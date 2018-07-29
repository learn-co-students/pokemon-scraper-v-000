class Pokemon
  attr_accessor :name, :type, :db

  def initialize(name, type, db)
    @name = name
    @type = type
    @db = db
  end

  def save
    db.execute("INSERT INTO pokemon (name, type) VALUES [self.name, self.type]")
  end

  def find
    db.execute("SELECT pokemon.id, pokemon.name, pokemon.type FROM pokemon WHERE pokemon.id = [self.id]")
  end
end

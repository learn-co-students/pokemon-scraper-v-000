class Pokemon
  @@all = []
  attr_accessor :name, :type, :db, :id
  def initialize(name:, type:, db:, id:)
    @name = name
    @type = type
    @db = db
    @id = id
    @@all << self
  end
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end
  def self.find(id, db)
    name = db.execute("SELECT name FROM pokemon WHERE id = ?", id).flatten[0]
    type = db.execute("SELECT type FROM pokemon WHERE id = ?", id).flatten[0]
    pokemond = {id: id, name: name, type: type, db: db}
    newoke = Pokemon.new(pokemond)
    return newoke
  end
end

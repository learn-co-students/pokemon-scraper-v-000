
class Pokemon
  attr_reader :id, :name, :type, :db
  @@all = []

  #@db = SQLite3::Database.new('db/pokemon.db')
  #@db.execute("CREATE TABLE IF NOT EXISTS pokemon(id INTEGER PRIMARY KEY, name TEXT, type TEXT)")

  def initialize(id, name, type, db)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
  end

  def self.save(id, name, type, db)
    insert = db.prepare("INSERT INTO pokemon(id, name, type) VALUES(?, ?, ?);")
    insert.execute(id, name, type)
  end

  #def create_from_selection

  def self.find(id, db)
    found = db.execute("SELECT id, name, type FROM pokemon WHERE id = (?);", id)
    Pokemon.new(found[0][0], found[0][1], found[0][2], db)
  end

  def alter_hp(id, hp)
    @db.execute("UPDATE pokemon SET hp = (?) WHERE id = (?);", hp, id)
  end

end

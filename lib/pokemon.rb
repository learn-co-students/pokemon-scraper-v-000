class Pokemon
  attr_reader :id, :name, :type, :db
  @@all = []

  @db = SQLite3::Database.new('db/pokemon.db')
  @db.execute("CREATE TABLE IF NOT EXISTS pokemon(id INTEGER PRIMARY KEY, name TEXT, type TEXT)")

  def initialize(id, name, type, db)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    insert = db.prepare("INSERT INTO pokemon(name, type) VALUES(?, ?, ?)")
    db.execute(insert.execute(name, type))
  end

end

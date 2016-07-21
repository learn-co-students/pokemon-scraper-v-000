class Pokemon

  @@all = []

  def initialize(id, name, type, database_connection)
    @id = id
    @name = name
    @type = type
    @db = database_connection
    @@all << self
#    database_connection.execute("DROP TABLE IF EXISTS pokemon")
#    database_connection.execute("CREATE TABLE IF NOT EXISTS pokemon(id INTEGER PRIMARY KEY, name TEXT, type TEXT)")
  end

  def self.all
    @@all
  end

  def self.save(name, type, database_connection)
    database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, database_connection)
    database_connection.execute("SELECT * FROM pokemon WHERE id = 1;")
  end

end

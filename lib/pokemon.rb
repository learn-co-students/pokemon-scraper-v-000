class Pokemon

  def self.new(id, name, type, database_connection)
    database_connection.execute("DROP TABLE IF EXISTS pokemon")
    database_connection.execute("CREATE TABLE IF NOT EXISTS pokemon(id INTEGER PRIMARY KEY, name TEXT, type TEXT)")
  end

  def self.save(name, type, database_connection)
    database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

end

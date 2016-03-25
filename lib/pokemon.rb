class Pokemon
  database_connection = SQLite3::Database.new('db/my_database.db')
  attr_reader :name, :type, :id, :db
  def initialize(id, name, type, db)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  def self.save(name, type, database_connection)
    database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end
  def self.find(id, database_connection)
    database_connection.execute("SELECT id, name, type FROM pokemon WHERE id = ?",id)
  end

end

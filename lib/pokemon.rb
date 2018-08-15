class Pokemon

  database_connection = SQLite3::Database.new('db/pokemon.db')
  @@all = []

  def initialize(name, type, database)
    @name = name
    @type = type
    @@all < self
  end
  def self.all
    @@all
  end

  def self.save(name, type, database_connection)
    database_connection.execute("INSERT INTO pokemon(name, type) Values(name, type)")
  end

end

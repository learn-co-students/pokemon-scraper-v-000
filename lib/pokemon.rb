class Pokemon
  attr_accessor :name, :type, :db, :id
  def initialize(id, name, type, db)
    @name = name
    @id = id
    @type = type
    @db = db
  end

  def self.save(name, type, database_connection)
    database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    db.execute("SELECT id, name, type FROM pokemon WHERE id = #{id}")
  end
end

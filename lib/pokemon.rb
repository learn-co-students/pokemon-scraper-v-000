class Pokemon

  attr_accessor :id, :name, :type, :db

  # database_connection = SQLite3::Database.new('db/pokemon.db')

  def initialize(id, name, type, db)
    @name = name
    @type = type
    @db = db
    @id = id
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
  end

end

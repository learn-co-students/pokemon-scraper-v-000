class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id, name, type, db)
    @id = id
    @name = name
    @type = type
    @db = SQLite3::Database.new('db/pokemon.db')
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type)
    VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    db.execute("SELECT * FROM pokemon WHERE id = 1;")
  end

end

class Pokemon
  attr_accessor :name, :type, :db, :id

  def initialize(id, name, type, db)
    @id = id
    @name = name
    @type = type
    @db = db

    #database_connection = SQLite3::Database.new(db)
  end

  def self.save(poke_name, poke_type, db)
    pokemons = SQLite3::Database.new(db)
#    db.execute("CREATE TABLE IF NOT EXISTS pokemons (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, type TEXT)")
    db.execute("INSERT INTO pokemons (name, type) VALUES (?,?)",poke_name,poke_type)
  end

  def self.find(id, db)
    db.execute("SELECT * FROM pokemons GROUP BY #{id}").flatten
  end
end

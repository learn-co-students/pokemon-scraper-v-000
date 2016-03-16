class Pokemon
  attr_accessor :name, :type, :db, :id

  def initialize(id, name, type, db)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(poke_name, poke_type, db)
    db.execute("CREATE TABLE IF NOT EXISTS pokemon (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, type TEXT)")
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)",poke_name,poke_type)
  end

  def self.find(id, db)
    db.execute("SELECT * FROM pokemon GROUP BY #{id}").flatten
  end
end

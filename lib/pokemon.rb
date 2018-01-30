class Pokemon
  attr_accessor :name, :type, :db

  def initialize(id, name, type, db)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
   db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id,db)
    db.execute("SELECT pokemon.id,pokemon.name,pokemon.type FROM pokemon WHERE id=(#{id});").flatten
  end

end

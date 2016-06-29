class Pokemon

<<<<<<< HEAD
  attr_accessor :name, :type, :db, :id

  def initialize (name, type, db, id)
    @name = name
    @type = type
    @db = db
    @id = id
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name,type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    db.execute("SELECT * FROM pokemon WHERE id = ?", id)
  end
end
=======
  attr_accessor :id, :name, :type, :db

  def initialize (id, name, type, db)
    @id = id
    @name = name
    @type = type
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    db.execute ("SELECT * FROM pokemon WHERE pokemon.id = id")
  end

end # => end class
>>>>>>> a11c1657a5249c3ab0952d5f30481891ee962949

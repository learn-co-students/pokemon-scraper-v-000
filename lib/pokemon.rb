class Pokemon

  attr_accessor :name, :db, :type, :id

  def initialize(id, name, type, db)
    @db = db
    @name = name
    @type = type
    @id = id
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    db.execute("SELECT * FROM pokemon WHERE id = ?", id)
  end

end

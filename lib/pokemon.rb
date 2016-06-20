class Pokemon
    attr_accessor :name, :id, :type, :db
  def initialize(name, id, type, db)
    @name = name
    @id = id
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    db.execute("SELECT * FROM pokemon WHERE id = " + id.to_s)
  end
end

class Pokemon

  attr_accessor :id, :name, :type, :db

  @@all = []

  def initialize(id, name, type, db)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES(?, ?)", name, type)
  end

  # create new object from row
  def self.find(id, db)
    db.execute("SELECT * FROM pokemon WHERE id = ? LIMIT 1", id).first
  end

end

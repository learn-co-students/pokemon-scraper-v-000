class Pokemon
  attr_accessor :name, :type, :db, :id

  def initialize(id)
    self.name = name
    self.type = type
    self.db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def find(id)

  end

end

class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id, name, type, database)
    @id = id
    @name = name
    @type = type
    @db = database
  end

  def self.save(name, type, database)
    database.execute("INSERT INTO Pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, database)
    database.execute("SELECT * FROM Pokemon WHERE id = ?", id)
  end

end

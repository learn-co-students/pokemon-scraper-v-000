class Pokemon

  @@all = []

  def initialize(id = nil, name, type, db)
    @name = name
    @type = type
    @db = db
    @id = id
    @@all << self
  end

  attr_accessor :name, :type, :db, :id

  def self.all
    @@all
  end

  def self.save(name, type, db)
    id = self.find_by_name(name).id
    db.execute("INSERT INTO pokemon (id, name, type) VALUES (?, ?, ?)", id, name, type)
  end

  def self.find_by_name(name)
    matches = self.all.select {|pokemon| pokemon.name == name}
    return matches[0]
  end

  # find by id
  def self.find(id, db)
    db.execute("SELECT id, name, type FROM pokemon WHERE id = ?", id)
  end
end

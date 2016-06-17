class Pokemon
  @@all = []

  def initialize(name, type, db)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
  end

  def self.save(id, name, type, database_connection)
    database_connection.execute("INSERT INTO db (id, name, type) VALUES (?, ?, ?)", id, name, type)
  end

  def self.find(name)
    self.all.detect{|s| s.name == name}
  end

end

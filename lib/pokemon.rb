class Pokemon

  @@all = []

  attr_accessor :id, :name, :type, :db

  def initialize(id)
    self.id = id
    self.all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, database_connection)
    database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, database_connection)
    # pk = database_connection.execute("SELECT * FROM pokemon WHERE id = ?", id)
    pk = database_connection.execute("SELECT id FROM pokemon WHERE id = ?", id)
    Pokemon.new(pk)
    #self.all[id - 1]
  end


end

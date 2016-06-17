class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id, name, type, database)
    @id = id
    @name = name
    @type = type
    @db = database
  end

  def self.save(pika, chu, database)
    database.execute("INSERT INTO pokemon (name, type) VALUES ('#{pika}', '#{chu}');")
  end

  def self.find(id, database)
    database.execute("SELECT * FROM pokemon;")
  end

end

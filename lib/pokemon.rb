class Pokemon
  attr_accessor :id, :name, :type, :hp, :db
  @@all = []
  def initialize(id:, name:, type:, hp: 60, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
    @@all << self
  end

  def self.all
    @@all
  end
  def self.save(name, type, database_connection)
    database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, database_connection)
    temp = database_connection.execute("SELECT * FROM pokemon WHERE id=?", id).flatten
    Pokemon.new(id:temp[0], name:temp[1], type:temp[2], hp:temp[3], db:database_connection)
  end
end

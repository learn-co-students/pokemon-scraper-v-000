class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id=nil, name=nil, type=nil, hp=60, db=nil )
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.create(database_connection)
    database_connection.execute("CREATE TABLE IF NOT EXISTS pokemon(id INTEGER PRIMARY KEY, name TEXT, type TEXT)")
  end

  def self.save(name, type, database_connection)
    database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, database_connection)
    record = database_connection.execute("SELECT * from pokemon WHERE id = (?)", id)
    self.new(record[0][0], record[0][1], record[0][2], record[0][3])
  end

  def alter_hp(hp, database_connection)
    database_connection.execute("UPDATE pokemon SET hp = (?) WHERE id = (?)",hp, @id)
  end
end

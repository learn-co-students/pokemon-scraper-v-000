class Pokemon

  @@all = []

  def initialize(id, name, type, database_connection)
    def id
      @id = id
    end
    def name
      @name = name
    end
    def type
      @type = type
    end
    def db
      @db = database_connection
    end
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, database_connection)
    database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, database_connection)
    database_connection.execute("SELECT * FROM pokemon WHERE id = 1;")
  end

  def self.alter_hp(id, new_hp, database_connection)
    database_connection.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, id)
  end

end

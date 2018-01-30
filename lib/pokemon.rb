class Pokemon
  attr_accessor :id, :name, :type, :db
  @@all = []

    def initialize(id, name, type, db)
      @id = id
      @name = name
      @type = type
      @@all << self
    end

    def self.all
      @@all
    end

    def self.save (name, type, database)
      database.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    def self.find(id, database)
      database.execute("SELECT * FROM pokemon WHERE id = ?", id) 
    end
end

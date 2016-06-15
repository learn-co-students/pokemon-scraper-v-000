class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id = nil, name, type, db)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",[name,type])
  end

  @@all = []
  
  def self.all
    @@all
  end

  def self.find (id, db)
    db.execute("SELECT Pokemon.id, Pokemon.name, Pokemon.type FROM pokemon WHERE Pokemon.id = ?", id)

  end

end

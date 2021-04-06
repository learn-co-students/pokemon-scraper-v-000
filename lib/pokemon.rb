class Pokemon
  attr_accessor :name, :id, :type, :db

  @@all = []

  def initialize(id,name,type,database)
    @id = id
    @name = name
    @type = type
    @db =  database
  end

  def self.save(name,type,database)
    database.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id,database)
    database.execute("SELECT pokemon.id,pokemon.name,pokemon.type FROM pokemon WHERE id=(?);",id).flatten
  end
end

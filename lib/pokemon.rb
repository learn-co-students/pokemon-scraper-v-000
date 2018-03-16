class Pokemon

  attr_accessor :id, :name, :type, :db

  @@all = []
  def initialize(pokemon)
    @id = pokemon.id
    @name = pokemon.name
    @type = pokemon.type
    @db = pokemon.db
    @@all << self
  end

  def self.save(name, type, db) #db is a class that is passed in
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type) #the last 2 values are what are passed
    #into the ??
  end

  def self.all
    @@all
  end
end

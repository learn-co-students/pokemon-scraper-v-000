class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(name)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
      db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    new_pokemon = db.execute("SELECT name, type FROM pokemon WHERE id = (?)")
    self.new(:name= new_pokemon[0], :type= new_pokemon[1])
  end
end

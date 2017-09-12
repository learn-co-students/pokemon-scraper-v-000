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
    new_pokemon.each do | pokemon_attribute |
      self.new
  end
end

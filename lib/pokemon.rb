class Pokemon
  attr_accessor :name, :type, :id, :db
  
  def initialize(name:, type:, id:, db:)
    @name = name
    @type = type
    @id = id
    @db = db
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(id, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id).first
    new_pokemon = Pokemon.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], db: db)
  end

  
  
end

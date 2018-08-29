class Pokemon
  attr_accessor :name, :id, :type, :db, :hp
  
  def initialize(name:, id:, type:, db:)
    @name = name
    @type = type
    @id = id
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(number, db)
    found = db.execute("SELECT * FROM pokemon WHERE pokemon.id=?", number).flatten
    #binding.pry
    #found contains [[1, "Pikachu", "electric"]] notice the [[]]
    #pkmon = 
    Pokemon.new(id: found[0], name: found[1], type: found[2],db: db)
    #binding.pry
  end
end

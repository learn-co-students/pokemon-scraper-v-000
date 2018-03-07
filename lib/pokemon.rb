class Pokemon

  def initialize(id:, name:, type:, db:)
    #binding.pry
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    pokedex = db.execute("SELECT * FROM  pokemon WHERE id=?",id).flatten
    test = Pokemon.new(pokedex[0],pokedex[1],pokedex[2],db)
  end
end

class Pokemon
attr_accessor :id, :name, :type, :hp, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @hp = 60
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    pokedex = db.execute("SELECT * FROM  pokemon WHERE id=?",id).flatten
    #binding.pry
    test = Pokemon.new(id: pokedex[0], name: pokedex[1], type: pokedex[2], db: db)
  end
end

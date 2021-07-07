class Pokemon
  
  attr_accessor :name, :type, :db, :id
  
  @@all= []
  
  def initialize(name:, type:, db:, id:)
    @name = name
    @type = type
    @db = db
    @id = id
  end 
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(id, db)
    pokemon = nil
    db.execute("SELECT name, type FROM pokemon WHERE id =?", id) do |result|
      pokemon_name = result[0] 
      pokemon_type = result[1]
      pokemon = Pokemon.new(name: pokemon_name, type: pokemon_type, id: id, db: db) 
     end
     pokemon
  end 
end

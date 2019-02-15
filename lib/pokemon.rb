class Pokemon
  attr_accessor :id, :name, :type, :db
  @@all = []

  def initialize(pokemon)
    #@id = pokemon[id]
    #@name = pokemon[name]
    #@type = pokemon[type]
    #@db = pokemon[db]
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(num, db)
   pokemon = db.execute("SELECT * FROM pokemon WHERE id=?", [num])
   new_pokemon = self.new(pokemon)
   new_pokemon.id = pokemon[0][0]
   new_pokemon.name = pokemon[0][1]
   new_pokemon.type = pokemon[0][2]

   return new_pokemon
 end
end

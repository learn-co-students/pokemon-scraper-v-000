class Pokemon
  attr_accessor :id, :name, :type, :db
  @@all = []
  
  def initialize(pokemon_hash)
    pokemon_hash.each { |key, value| self.send("#{key}=", value) }
  end
  
  def self.all
    @@all
  end
  
  def self.save(name = "", type = "", db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(id, db)
    pokemon = {
      :id => id,
      :name => pokemon_name = db.execute("SELECT pokemon.name FROM pokemon WHERE id = #{id}").flatten[0],
      :type => pokemon_type = db.execute("SELECT pokemon.type FROM pokemon WHERE id = #{id}").flatten[0],
      :db => db
    }
    self.new(pokemon)
  end
end

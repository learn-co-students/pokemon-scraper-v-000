class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize(keywords)

  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id_num, db)
     pokemon = db.execute("SELECT * FROM pokemon WHERE id=?", [id_num])
     pokemon_new = self.new(pokemon)
     pokemon_new.id = pokemon[0][0]
     pokemon_new.name = pokemon[0][1]
     pokemon_new.type = pokemon[0][2]
     return pokemon_new
    end
end

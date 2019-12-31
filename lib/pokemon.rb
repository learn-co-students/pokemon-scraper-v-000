class Pokemon
  attr_accessor :name, :type, :db
  attr_reader :id

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES(?, ?)", name, type)
    end

    def self.find(id, db)
      pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
      new_pokemon_id = pokemon[0][0]
      new_pokemon_name = pokemon[0][1]
      new_pokemon_type = pokemon[0][2]
      new_pokemon = self.new({id: new_pokemon_id, name: new_pokemon_name, type: new_pokemon_type, db: db})
      new_pokemon
    end
end

class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db

  end


  def self.find(id, db)
      # Pokemon.new.db(id: pokemon[0], name: pokemon[1], type: pokemon[2], db: db)
      db.execute("SELECT * FROM pokemon WHERE pokemon.id = id")
      Pokemon.new(id = pokemon_info[0], name = pokemon_info[1], type = pokemon_info[2], db = db)
  end


  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES ('#{name}', '#{type}')")
  end


end

class Pokemon

  attr_accessor :name, :type, :db, :id

  def initialize(id: id, name: name, type: type, db: db)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(wanted_id, db)
    pokemon_arr = db.execute("SELECT pokemon.* FROM pokemon WHERE pokemon.id = #{wanted_id}").flatten
    Pokemon.new(name: pokemon_arr[1], id: pokemon_arr[0], type: pokemon_arr[2], db: db)
  end

end

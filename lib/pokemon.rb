class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp

  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(pokemon_id, db)
    pokemon_array = db.execute("SELECT * FROM pokemon WHERE id = ?", pokemon_id).flatten
    # binding.pry
    Pokemon.new(id: pokemon_array[0], name: pokemon_array[1], type: pokemon_array[2], db: db, hp: pokemon_array[3])
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE name = ?", new_hp, self.name)
  # binding.pry
  end




end

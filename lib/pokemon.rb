class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  def initialize(id:, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    found_pokemon_row = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    new_pokemon = Pokemon.new(id:found_pokemon_row[0], name:found_pokemon_row[1], type:found_pokemon_row[2], hp:found_pokemon_row[3], db:db)
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end


end

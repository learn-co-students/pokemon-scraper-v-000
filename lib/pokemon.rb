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
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", [name, type])
  end

  def self.find(id_num, db)
    pokemon_object = db.execute("SELECT * FROM pokemon WHERE id = ?", [id_num]).flatten
    Pokemon.new(id: pokemon_object[0], name: pokemon_object[1], type: pokemon_object[2], hp: pokemon_object[3], db: db)
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", [new_hp, self.id])
  end
end

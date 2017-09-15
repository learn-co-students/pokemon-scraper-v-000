class Pokemon
  attr_accessor :name, :type, :db, :id

  def initialize(id:, name:, type:, db:)
    @name = name
    @type = type
    @db = db
    @id = id
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end


  def self.find(id_num, db)
    pokemon_char = db.execute("SELECT * FROM pokemon WHERE id = ?", id_num).flatten
    Pokemon.new(id: pokemon_char[0], name: pokemon_char[1], type: pokemon_char[2], db: db)
  end

  def pokemon_hp
    hp = db.execute("ALTER TABLE pokemon ADD hp SET DEFAULT 60")
  end

end

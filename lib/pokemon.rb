class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(find_id, db)
    pokemon_from_db = db.execute("SELECT * FROM pokemon WHERE id = ?", find_id).flatten
    self.new(id: pokemon_from_db[0], name: pokemon_from_db[1], type: pokemon_from_db[2], hp: pokemon_from_db[3], db: db)
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end

end

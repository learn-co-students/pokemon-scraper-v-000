class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(arguments)
    arguments.each { |key, value| self.send("#{key}=", value) }
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    db_pokemon_info = db.execute("SELECT * FROM pokemon WHERE ID = ?", id).flatten
    self.new(id: db_pokemon_info[0], name: db_pokemon_info[1], type: db_pokemon_info[2], hp: db_pokemon_info[3], db: db)
  end

end
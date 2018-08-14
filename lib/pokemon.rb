class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db: @db)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    pokemon_info = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    self.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], db: db)

  end

  def alter_hp(hp, db)
  db.execute("UPDATE pokemon SET hp = ? WHERE hp = 60", hp)
  end
end

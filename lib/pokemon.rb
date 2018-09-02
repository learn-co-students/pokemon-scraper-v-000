class Pokemon
  attr_accessor :id, :name, :type, :db

  @@all = []

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find (id_num, db)
    pokemon_i = db.execute("SELECT * FROM pokemon WHERE id = ?", id_num).flatten
    Pokemon.new(id: pokemon_i[0], name: pokemon_i[1], type: pokemon_i[2], db: db)
  end

  def hp_alter(updated_hp, db)
    db.execute("UPDATE pokemon SET hp = ?", updated_hp)
  end
end

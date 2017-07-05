class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  @@all = []

  def initialize(name:, type:, db:, id:, hp: 60)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], hp: pokemon[3], db: db)
  end

  def alter_hp
    "UPDATE pokemon SET hp = 59 WHERE name = 'Pikachu';"
    "UPDATE pokemon SET hp = 59 WHERE name = 'magikarp';"
  end

end

class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  @@all = []

  def initialize(id:, type:, name:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
    @@all << self
  end

  def self.save (name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    pokemon_search = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten

    pokemon_search[1] = Pokemon.new(id: pokemon_search[0], type: pokemon_search[2], name: pokemon_search[1], hp: pokemon_search[3], db: db)
  end

  def alter_hp(hp, db)

    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)

  end

end

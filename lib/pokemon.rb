class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, hp: 60, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id=?",id).flatten
    id = pokemon[0]
    name = pokemon[1]
    type = pokemon[2]

    new_pokemon = Pokemon.new(id: id, name: name, type: type, db: db)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ?", hp)
  end
end

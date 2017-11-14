class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp: 60)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name , type)
  end

  def self.find(id, db)
    pokemon = db.execute("SELECT * FROM pokemon
    WHERE pokemon.id = ?", id)
    self.new(id:pokemon[0][0], name: pokemon[0][1], type: pokemon[0][2], hp:pokemon[0][3], db: db)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
  end

end

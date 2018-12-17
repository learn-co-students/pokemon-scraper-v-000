class Pokemon
  attr_accessor :name, :type, :db, :id, :hp

  def initialize(id:, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(num, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id=?", num)
    Pokemon.new(id: pokemon[0][0], name: pokemon[0][1], type: pokemon[0][2], hp: pokemon[0][3], db: db)
  end

  def alter_hp(num, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", [num], [self.id])
    self.hp = num
  end
end

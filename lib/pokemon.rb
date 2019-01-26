class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  @@all = []

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id, db)
    pkmn = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    name = pkmn[1]
    type = pkmn[2]
    Pokemon.new(id: id, name: name, type: type, db: db)
  end

end

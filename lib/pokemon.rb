class Pokemon
  @@all = []
  attr_accessor :id, :name, :type, :db, :hp
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = 60
    @@all << self
  end
  def self.all
    @@all
  end
  def self.save(name,type,db)
    db.execute("INSERT INTO pokemon (name,type) VALUES (?,?)", name, type)
  end
  def self.find(id, db)
    table = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id).flatten
    Pokemon.new(id: table[0], name: table[1], type: table[2], db: db)
  end
end

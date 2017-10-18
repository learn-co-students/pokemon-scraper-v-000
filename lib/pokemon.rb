class Pokemon
  attr_accessor :name, :type, :db, :id, :hp
  @@all = []

  def initialize(id:, name:, type: , db:, hp: 60)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id, db)
    n = db.execute("SELECT name FROM pokemon WHERE pokemon.id = ?", id).join("")
    t = db.execute("SELECT type FROM pokemon WHERE pokemon.id = ?", id).flatten[0] # or .flatten.first would also work
    poke = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id).join("")[0][3]
    #puts @db.execute("SELECT hp FROM pokemon")
    Pokemon.new(id: id,name: n,type: t,db: db, hp: poke)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE name = ?;", hp, self.name)
  end
end

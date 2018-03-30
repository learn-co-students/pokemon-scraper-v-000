class Pokemon
  attr_accessor :name, :type, :db, :id, :hp

@@all =[]

  def initialize(name:, type:, db:, id:, hp: nil)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type) #use bound parameters for any variable data that you are passing into your SQL statement
  end

  def self.find(id, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    self.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], db: db, hp: pokemon[3])
  end

  def alter_hp(hit, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hit, self.id)
  end
end

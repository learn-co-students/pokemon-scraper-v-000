class Pokemon
  attr_accessor :name, :type, :db, :id, :hp
  @@all = []

  def initialize(name: name, type: type, db: db, id: id, hp: hp)
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
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(x, db)
    array = db.execute("SELECT * FROM pokemon WHERE ? = id", x)[0]
    Pokemon.new(id: array[0], name: array[1], type: array[2], db: db, hp: array[3])
  end

  def alter_hp(h, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE name = ?", h, self.name)
  end

end

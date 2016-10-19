class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  @@all = []

  def initialize(id: id, name: name, type: type, db: db, hp: nil)
    self.id = id
    self.name = name
    self.type = type
    self.db = db
    self.hp = hp
    Pokemon.all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", [name, type])
  end

  def self.find(id, db)
    pk = db.execute("SELECT * FROM pokemon WHERE (?) = id",[id])
    Pokemon.new(id: pk[0][0], name: pk[0][1], type: pk[0][2], db: db, hp:60)
  end

  def self.all
    @@all
  end
end

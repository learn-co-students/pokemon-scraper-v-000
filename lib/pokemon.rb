class Pokemon
  attr_accessor :name, :type, :db, :id, :hp

  @@all = []

  def self.all
    @@all
  end

  def initialize(name: nil, type: nil, db: nil, id: nil, hp: nil)
    self.name = name
    self.type = type
    self.db = db
    self.id = id
    self.hp = hp
    self.class.all << self
  end

  def self.save(name, type, db)
    db.execute('INSERT INTO pokemon (name, type) VALUES (?, ?)', name, type)
  end

  def self.find(id, db)
    id, name, type, hp = db.execute('SELECT * FROM pokemon WHERE id = ?', id)[0]
    new(name:name, type: type, db: db, id: id, hp: hp)
  end

  def alter_hp(power, db)
    self.hp = power
    db.execute('UPDATE pokemon SET hp = ? WHERE id = ?', self.hp, self.id)
  end
end

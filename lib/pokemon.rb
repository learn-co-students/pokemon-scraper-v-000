class Pokemon
  attr_accessor :name, :type, :db, :id, :hp

  @@all = []

  def self.all
  @@all
  end

  def initialize(id: nil, name: nil, type: nil, db: nil, hp: nil)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp
    @@all << self
    end

  def self.save(name, type, db)
    db.execute('INSERT INTO pokemon (name, type) VALUES (?, ?)', name, type)
  end

  def self.find(id, db)
    id, name, type, hp = db.execute("SELECT * FROM pokemon WHERE id = ?", id)[0]
    self.new(name: name, type: type, db: db, id: id, hp: hp)
  end

  def alter_hp(power, db)
     self.hp = power
     db.execute('UPDATE pokemon SET hp = ? WHERE id = ?', self.hp, self.id)
  end
 end

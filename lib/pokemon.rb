class Pokemon

  attr_accessor :id, :name, :type, :db, :hp
  @@all = []

  def initialize(id = nil, name = nil, type = nil, db = nil, hp = nil)
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
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    p = db.execute("SELECT * FROM pokemon WHERE id = #{id}")
    Pokemon.new(p[0][0], p[0][1], p[0][2], db, p[0][3])
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ?", hp)

  end
end

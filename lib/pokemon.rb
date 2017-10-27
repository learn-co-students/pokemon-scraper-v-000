class Pokemon
  attr_accessor :name, :type, :db, :id, :hp

  @@all = []

  def initialize(args)
    @name  = args[:name]
    @type  = args[:type]
    @db  = args[:db]
    @id  = args[:id]
    @hp  = args[:hp]
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", [name, type])
  end

  def self.find(id, db)
    poke = db.execute("SELECT * FROM pokemon WHERE id = ?;",[id])
    Pokemon.new(name: poke[0][1], type: poke[0][2], db: db, id: poke[0][0], hp: poke[0][3])
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?;",[hp, @id])
  end

end

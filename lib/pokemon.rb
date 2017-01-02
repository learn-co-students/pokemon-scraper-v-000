class Pokemon
  attr_accessor :name, :type, :db, :id, :hp



  def initialize(id = nil, name = nil, type = nil, hp = nil, db = nil)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    row = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten

    Pokemon.new(id = row[0], name = row[1], type = row[2], hp = row[3], db = db)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
  end
end

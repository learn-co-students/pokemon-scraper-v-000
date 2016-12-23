class Pokemon

  attr_reader :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp:nil)
    @id   = id
    @name = name
    @type = type
    @db   = db
    @hp   = hp
  end

  def alter_hp(hp, db)
    @hp = hp
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", @hp, @id)
  end

  def self.find(id, db)
    row = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    Pokemon.new(id:id, name:row[0][1], type:row[0][2], db:db, hp:row[0][3])
  end

  def self.save(name, type, db)
    max_id = db.get_first_value("SELECT MAX(id) FROM pokemon" )
    next_id = max_id ? max_id + 1 : 1
    db.execute("INSERT INTO pokemon (id, name, type) VALUES (?, ?, ?)", next_id, name, type)
  end
end

class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id, name = nil, type = nil, hp = nil, db = nil)
    @id = id
    @name = name if name
    @type = type if type
    @hp = hp if hp
    @db = db if db
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", [new_hp, self.id])
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (id, name, type) VALUES ( ?, ?, ?)", [@id, name, type])
  end

  def self.find(id, db)
    db_result = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(*db_result, db)
  end

end

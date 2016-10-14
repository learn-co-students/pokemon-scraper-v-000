class Pokemon

  attr_accessor :name, :type, :db, :id, :hp

  def initialize(id:, name:, type:, hp:nil, db:)
    @id, @name, @type, @hp, @db = id, name, type, hp, db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(idnumber, db)
    poke = db.execute("SELECT * FROM pokemon WHERE id=?;", idnumber).flatten
    Pokemon.new(id: poke[0], name: poke[1], type: poke[2], hp: poke[3], db: @db)
  end

  def alter_hp(altered_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", altered_hp, self.id)
  end
end

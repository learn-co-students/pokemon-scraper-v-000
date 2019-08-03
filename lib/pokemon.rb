
class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp:nil)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    row = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    Pokemon.new(id:row[0][0], name:row[0][1], type:row[0][2], hp:row[0][3], db:db)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp=? WHERE id=?;",hp,self.id)
  end
end

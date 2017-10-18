
class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    new_name = db.execute("SELECT name FROM pokemon WHERE id = ?", id).join("")
    new_type = db.execute("SELECT type FROM pokemon WHERE id = ?", id).join("")
    new_hp = db.execute("SELECT hp FROM pokemon WHERE id = ?", id).join("").to_i
    self.new(id: id, name: new_name, type: new_type, hp: new_hp, db: db)
  end

  def alter_hp(hp, db)
    @hp = hp
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", @hp, @id)
  end

end

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
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id,db)
    row = db.execute("SELECT * FROM pokemon WHERE id = ?",id)
    self.new(id: row.flatten[0], name: row.flatten[1], type: row.flatten[2], db: db, hp: row.flatten[3])
  end

  def alter_hp(hp, db)
    @hp = hp
    @db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", @hp, @id)
  end
end

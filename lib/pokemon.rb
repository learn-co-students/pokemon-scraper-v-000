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
    find_by_id = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    self.new(id: find_by_id[0][0], name: find_by_id[0][1], type: find_by_id[0][2], db: db, hp: find_by_id[0][3])
  end

  def alter_hp(temp_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", temp_hp, self.id)
  end
end

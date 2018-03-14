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
    selected = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    self.new(id: selected[0], name: selected[1], type: selected[2], db: db, hp: selected[3])
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ?", new_hp)
  end
end

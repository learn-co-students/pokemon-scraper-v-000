class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(attributes)
    self.id = attributes[:id]
    self.name = attributes[:name]
    self.type = attributes[:type]
    self.db = attributes[:db]
  end

  def self.save(name, type, db)
    insert = db.prepare("INSERT INTO pokemon (name, type) VALUES (?, ?);")
    insert.execute(name, type)
  end

  def self.find(id, db)
    select = db.prepare("SELECT * FROM pokemon WHERE id = ?;")
    result = select.execute(id).next
    new({id: result[0], name: result[1], type: result[2], db: db})
  end

  def alter_hp(hp, db)
    update = db.prepare("UPDATE pokemon SET hp = ? WHERE id = ?;")
    update.execute(hp, self.id)
  end

  def hp
    select = db.prepare("SELECT hp FROM pokemon WHERE id = ?;")
    select.execute(self.id).next[0]
  end

end

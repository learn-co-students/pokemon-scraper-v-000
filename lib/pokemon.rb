class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(ar)
    @id = ar[:id]
    @name = ar[:name]
    @type = ar[:type]
    @db = ar[:db]
    @hp = ar[:hp]
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id, db)
    row_data = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(id: row_data[0], name: row_data[1], type: row_data[2], hp: row_data[3], db: db)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
  end
end

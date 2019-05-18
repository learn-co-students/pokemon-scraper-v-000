class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(attributes)
    attributes.each{|k, v| self.send "#{k}=", v}
  end

  def self.save(name, type, db)
    sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"
    db.execute(sql, name, type)
    @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end

  def self.find(id, db)
    sql = "SELECT * FROM pokemon WHERE id = ?"
    row = db.execute(sql, id)
    row_hash = {id: row[0][0], name: row[0][1], type: row[0][2], db: db, hp: row[0][3]}
    new_pokemon = Pokemon.new(row_hash)
    new_pokemon
  end

  def alter_hp(hp, db)
    sql = <<-SQL
           UPDATE pokemon
           SET name = ?, type = ?, hp = ?
           WHERE id = ?;
           SQL
    db.execute(sql, self.name, self.type, hp, self.id)
    self.hp = hp
  end
end

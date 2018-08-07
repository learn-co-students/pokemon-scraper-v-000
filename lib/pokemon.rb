class Pokemon
  attr_accessor :name, :type, :db, :id, :hp

  def initialize(name:, type:, db:, id: nil, hp: nil)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp
  end

  def self.save(name, type, db)
    sql = <<-SQL
          INSERT INTO pokemon (name, type)
          VALUES (?,?)
          SQL
    db.execute(sql, name, type)
    @id = db.execute("SELECT last_insert_rowid() FROM pokemon")
  end

  def self.find(id, db)
    sql = <<-SQL
          SELECT * FROM pokemon WHERE id = ?
          SQL
    row = db.execute(sql, id)[0]
    self.new(name: row[1], type: row[2], db: db, id: row[0], hp: row[3])
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)

  end
end

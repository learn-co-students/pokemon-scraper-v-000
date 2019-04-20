class Pokemon
  attr_accessor :name, :type, :db, :hp
  attr_reader :id

  def initialize(name:, type:, id: nil, db:, hp: nil)
    @name = name
    @type = type
    @id = id
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type) VALUES (?, ?)
    SQL

    db.execute(sql, name, type)
    @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end

  def self.find(id, db)
    sql = <<-SQL
      SELECT * FROM pokemon WHERE id = ? LIMIT 1
    SQL

    found_pokemon = db.execute(sql, id).flatten
    Pokemon.new(id: found_pokemon[0], name: found_pokemon[1], type: found_pokemon[2], hp: found_pokemon[3], db: db)
  end

  def alter_hp(updated_hp, db)
    sql = <<-SQL
      UPDATE pokemon SET hp = ? WHERE id = ?
    SQL

    db.execute(sql, updated_hp, self.id)
  end
end
